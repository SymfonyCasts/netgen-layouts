# Block Views

Let's override one other template completely. On the Skills page - I'll go into the individual skill layout - we're using a Contentful entry here, which is a "referenced asset", and it's rendering as this image tag. Cool! This is a great example of how a single Block type, which is a Contentful entry field, can have multiple View types (which basically means "multiple templates"). Each of these different View types will be rendered by a different template internally. We actually see this with a lot of different Block types - even the Grid Block type. I'll add one down here temporarily. It has a View type that can actually go *between* List and Grid.

A List and a Grid are *both* the same Block type, actually. They just have a different View type, meaning they're rendered by different templates. I'll go ahead and delete that.

Anyway, every Block type can have one or more View types that you can then reference. I actually want to dive a *little* deeper into this View concept. Find your terminal and run:

```terminal
./bin/console debug:config netgen_layouts view
```

What I'm doing here is debugging the View configuration under `netgen_layouts`.

If you do this, you're going to get a *ton* of content. There are several root keys on here like `parameter_view`, `layout_view`, and a few others. But there's actually only *two* that we care about right now - `block_view`, which we'll talk about now, and `item_view`, which controls how the items in a List or Grid render. We actually saw that earlier when we were customizing how our Recipe item would look in a List or Grid. We'll talk more about those soon.

Anyway, to zoom in on the block views, we'll run that same command, but add:

```terminal
view.block_view.defaults
```

So block views, very simply, control how *entire* blocks are rendered. This one, for example, controls how the Title block, or the Text block, *or* List block is rendered. It also has a bunch of root keys like `default`, `app`, and `ajax`. And we *know* what those mean. "Default" means these are used on the frontend, "app" means they're used on the admin. and "ajax", which is *not* as common, is is used on the frontend for AJAX calls. So when we're talking about overriding templates, what we *really* care about is the `default` key.

I'm actually going to zoom in one more time by adding

```terminal
.default
```
to the command. These are all the block views that will be be used on the frontend. The *trickiest* thing about these are the `match` part.

When you define a block view, it's common to define the template that should be used when *two* things match. I'll search for "list/grid" here and... ah! This is a really good example. This has two matches. This `block\definition` is set to `list` because, *technically*, the the Block type for both List and Grid is actually called "list". The second thing, down here, is `block\view_type` set to `grid`. So if you're using the `list` `block\definition` and `block\view_type` `grid`, you're going to use this template right here.

By the way, both of these things can be seen very clearly from the web debug toolbar. If I go to the homepage, click on the Layouts web debug toolbar, and go to "Rendered blocks"... down here... look at this! You can see "Block definition: List", "View type: grid", and then it points to the template that's rendered for that. In this case, it's referring to this Grid right here. So... why is the Title block rendered by `title.html.twig`? We can actually see that in this configuration. Let me search for "title"... here we go. This basically says that if the `block\definition` is `title` and the `block\view_type` is `title`, use this template. This is an example of a Block type that only has *one* View type, not multiple different block views. This really means that when we're using the Title block type, we use this template.

Let's look back at our goal here. I want to override the template that renders this image. We know that this is a Contentful entry field and it has a View type of "Referenced assets". We can actually find that in here. I'll search for "assets" and... here we go! So if your `block\definition` is a `contentful_entry_field` and the `block\view_type` is `assets`, this is the template that's being used internally. So if we want to override *just* the `assets` View type of the Contentful entry, *that's* the template we need to override.

We could have very easily seen this by going to the web debug toolbar and finding the template *there*, but *now* we understand a bit more about how blocks are rendered and how each block can have multiple views, so you can *choose* how they're rendered. Later, we'll add another view to an existing block.

Okay, so let's get to work overriding this. You see we have `/nglayouts/themes/standard` before. *Then* we need `/block`, followed by this path right here. So instead of our `/block` directory, I'll create a *new* sub-directory called `/contentful_entry_field`. And inside of *that*, create a new `assets.html.twig` file. For now, I'll just say `ASSET`. If we go back to the frontend... yes! It *instantly* sees it! We're now in control!

Like before, we probably don't want to override the *entire* template, so I'm going to open the core template - `assets.html.twig` - so we can steal from it. Temporarily, let's just copy the whole thing here and... yep! That works.

Contentful is fairly advanced and complicated, and you can see that this supports fields that are a single image as well as multiple images. You can keep this as flexible as you want, but you can *also* make this your own. I'm actually going to delete a bunch of stuff in here. I don't need this block either, so I'll also delete that and replace it with a very simple image. I'll also print the URL. You would have seen this in the code that we had before. And here, one of the things you can do with Contentful, if you want a height and width, is say `?h=`, and I'll just paste in this height and width code here. If you did a little digging, you'd find that this is how you get the URL. In Contentful, you can also add a little `?h=` and `?w=` for width and height, and actually read in the width and height parameters from the block. That means I'm actually reading this width and height right here, so it will no longer render as an image that physically has those as width and height attributes anymore. I'll just request one from Contentful that size and let the image element be whatever size it is naturally. If you refresh and try that... yeah! I think that worked! Looks great!

Now one thing you have to be careful about when you customize these fields is making sure you don't lose certain flexible itemd. For example, right here, there's actually a spot where I can put a custom CSS class on that image. If we did that *right now*, it *won't* work because I'm simply not rendering those on my class right now. That's totally fine, and if you want to support that, you'll just need to make sure that you add that stuff in. We can say `class="{{ css_class }}"`, which is one of the variables that you saw earlier, and while we're here, I'll also add an `alt` attribute set to `field.value.title`. When we try that... *awesome*! I love it! There's our `alt` and *there's* our classes, including some core classes that Layouts always adds.

Okay, we just talked about block views - how templates are configured for entire blocks. Next, let's talk about *item views* and how we can customize the template that's used when rendering an item inside of a Grid or List. We'll use this to *style* our skill items.
