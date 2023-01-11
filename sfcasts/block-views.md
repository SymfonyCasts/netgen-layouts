# Block Views & View Types

Let's override one other template completely. Go into the Individual Skill Layout.
We're using a Contentful entry here, which is a "Referenced asset"... and it's
rendering as this image tag. Cool!

## Block "View Types" / Templates

This is a great example of how a single Block type - for example the "Contentful
Entry Field" block type - can have multiple *View types*, which basically means
"multiple templates". Each of these different View types will be rendered by a
different template. We actually see this with a lot of different Block types - even
the Grid Block type. I'll add one down here temporarily. It has a View type that
allows you to switch *between* List and Grid. Yup, the List and Grid blocks are
*actually* both the *same* Block type internally: they just have a different View
type, meaning each is rendered by a different template. Go ahead and delete that.

Anyway, every Block type can have one or more View types. And I actually want to dive
a *little* deeper into this concept of "views". Find your terminal and run:

```terminal
php ./bin/console debug:config netgen_layouts view
```

I'm debugging the configuration that could live under the `view` key
below the `netgen_layouts` key:

[[[ code('831b81bbff') ]]]

When you run this, you see a *ton* of config. Notice that there are several
root keys, like `parameter_view`, `layout_view`, and a few others. But there are
actually only *two* that we care about: `block_view`, which we'll talk about now,
and `item_view`, which controls how the items in a List or Grid render.
We actually saw this one earlier when we customized how our Recipe "item" rendered
inside a List or Grid. We'll talk even *more* about those soon.

## The Block View Config

Anyways, to zoom in on the block views, run that same command, but add `.block_view`

```terminal-silent
php ./bin/console debug:config netgen_layouts view.block_view
```

Block views, very simply, control how *entire* block types are rendered. For example,
we can see how the "Title block" renders... or the "Text block", *or* how the
"List block" renders.

This `block_view` config can have several keys below it, like `default`, `app`,
and `ajax`. And *we* know what those mean. `default` means these are used on the
frontend, `app` means they're used in the admin section and `ajax`, which is *not*
as common, is used on the frontend for AJAX calls. So to override the frontend
template for a block, we really mean that we want to override its block "view"
under the `default` key.

Let's... zoom in one more time by adding `.default`:

```terminal-silent
php ./bin/console debug:config netgen_layouts view.block_view.default
```

## The "match" config

These are all the block views that will be used on the frontend. The *trickiest*
thing about these are the `match` part.

When you define a "block view", it's pretty common to define the template that should
be used when *two* things match. Search for "list\grid": this is a great
example. This has *two* `match` items: `block\definition` is set to `list` because,
*technically* the "Block type" for both the List and Grid blocks is called `list`.
The second match condition is `block\view_type` set to `grid`.

Together these mean that if a block is being rendered whose `block\definition`
is `list` and whose `block\view_type` is `grid`, use this.

By the way, both of these things can be seen very clearly from the web debug toolbar.
Go to the homepage, click on the Layouts web debug toolbar, and go to "Rendered
blocks". Down here... look at this! You can see "Block definition: List", "View
type: grid"! And then it points to the template that was rendered. In this case,
it's referring to this Grid right here.

So then... why is the Title block rendered by `title.html.twig`? We can see that
in the config. Search for "title"... here we go. This says: if the `block\definition`
is `title` and the `block\view_type` is `title`, use this template. This is an example
of a Block type that only has *one* View type. So, in practice, this is the view
that's used for *all* title blocks.

## Find & Overriding the Contentful Field Assets View

Ok, let's remember our original goal: to override the template that renders this
image. We know that this is a "Contentful entry field" and it has a View type of
"Referenced assets". So... we can find that in here!

Search for "assets" and... there it is! So if `block\definition` is
`contentful_entry_field` and the `block\view_type` is `assets`, this is the template!
This means that if we want to override *just* the `assets` View type of the Contentful
entry, *that's* the template we need to override.

And yes, we could have very easily found this by going to the web debug toolbar and
finding the template *there*. But *now* we understand a bit more about how blocks
are rendered and how each block can have multiple views so that we can *choose*
how they're rendered. Later, we'll add an extra "view type" to an existing block.

Okay, so let's get to work. The path starts with the normal
`nglayouts/themes/standard/`, *then* we need `block/`, followed by this path.
So inside of our `block/` directory, create a *new* sub-directory called
`contentful_entry_field/`. And inside of *that*, a new `assets.html.twig`. For
now, I'll just say `ASSET`:

[[[ code('c9fc9a0ef9') ]]]

Ok! Spin over to the frontend and... yes! It *instantly* sees it! We're now in
control!

## Making the Template Fancier

Like before, we probably don't want to override the *entire* template. Instead,
open the core template - `assets.html.twig` - so we can steal, um borrow from it.
Temporarily, copy the whole thing, paste:

[[[ code('51c983bda4') ]]]

And... yep! That works.

Contentful is fairly advanced... and you can see that this supports fields that
hold a single image as well as multiple images. You can keep this as flexible as you
want, but you can *also* make it your own. I'm going to *drastically* simplify
this template... and replace it with a very simple image. For the `src`, I'll
paste in some code:

[[[ code('038afc2340') ]]]

All of the fancy Twig parts of this code were in the template before. This also
shows off a Contentful superpower where you can control the image size. Calling
`block.parameter()` allows us to read the *options* from the layouts admin, where
we earlier configured this block to have a width and height of 200.

Let's see what it looks like! Refresh. Yeah! It looks like it worked!

## Choosing to Render or Not Render Complex Options

But I *do* want to want give one small warning about customize templates: make sure
you don't lose flexibility that you need. For example, we know that we can add
extra CSS classes to any block via the admin.

If we did that *right now*, it would *not* work because... we're simply not rendering
those classes! And, that might be fine. But if you *do* want to support that, you'll
need to make sure to add it. In this case we can say `class="{{ css_class }}"`,
which is one of the variables we saw earlier. And while we're here, let's also
add an `alt` attribute set to `field.value.title`:

[[[ code('a241a5c6a7') ]]]

When we try this... I love it! There's the `alt` attribute and *there's* our class,
including some core classes that Layouts always adds to that variable.

Okay, we just talked about block views: how templates are configured for entire
blocks. Next, let's talk about *item views*: how we customize the template
that's used when rendering an *item* inside of a Grid or List. We'll use this to
*style* our skill items.
