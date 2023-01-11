# Deep Dive into Item Views

When it comes to customization, you can do *a lot* of damage by looking at which
templates are rendering and using the theme system to override them. *But* there
*are* a few cases where you'll need to get even more specific.

For example, suppose we want to modify the "item" template for how the skills grid
renders on the homepage. If you check the web debug toolbar here and scroll down...
I'll actually search for "contentful"... ah, there we go. You can see
`grid.html.twig`... which renders `item/contentful_entry.html.twig`. To customize
the item, we *could* override that template. *Easy peasy*.

The *problem* is that, in Contentful, we have *multiple* content types: we have Skills
*and* Advertisements. So if we override this template, that will override it for
*both* Skills and Advertisements... and we *probably* want those to look different.
So, how can we solve this?

## Diving into the item_view Config

Earlier, we ran `debug:config netgen_layouts view` and talked about the two main
sections under here - `block_view` (which controls how blocks render) and `item_view`.

```terminal-silent
php ./bin/console debug:config netgen_layouts view.item_view
```

As I've said a few times, *some* blocks, like Grid and List, render individual
*items*. This `item_view` config is where we define *those* templates. And you'll
see some familiar root keys: `default` for the frontend, `ajax` for AJAX calls,
and `app` for the admin. Once again, this uses the `match` config and... hey! We
see our entry in here! Remember `recipes_default`? We configured this inside of
our config file, and it's one of the two *real* item templates we have right now:

[[[ code('13766103ac') ]]]

There's one for recipes, and then Contentful has one for *all* of the Contentful
items.

So again, we *could* just override this template via the themeing system and be done.
But our goal is to override this template *only* when the item is a skill, like this
one. So how do we do that? By adding our *own* `item_view` to this list that matches
that *single* content type. Let's do it!

## Adding a Custom item_view

Over here... we're under `item_view`, `default` for the frontend and we have the
one entry from earlier: `recipes_default`. Let's add another. Call it
`contentful_entry/skill`, though this particular key doesn't make any difference.
Below that, set `template` to `@nglayouts/item/contentful_entry`, followed
by `skill.html.twig`:

[[[ code('f2a3ae08af') ]]]

Before, we were using `nglayouts` *without* the `@`... just because I told you
that `nglayouts/` was a nice directory for organizing things. Internally, Layouts
uses `@nglayouts` in its template paths. What's the difference? By adding
the `@`, we're hooking into the themeing system. So because we have
a `templates/nglayouts/` directory with `themes/standard/` inside, it will use
our template. Feel free to use `@nglayouts` or just `nglayouts`. I just wanted
you to understand the difference because you'll see the `@nglayouts` syntax
all over the place.

## Matching just One Content Type

The *really* important key here is `match`. We want to match *only* when we're working
with a `contentful_entry`. Ok, copy `match` from the config... and paste.

But we need to be more specific. We *also* need to match only when the *type*
of the content is a *skill*. But how do we do that? What matchers are even available?
There *is* a core list... but did Contentful add any *additional* matchers that we
could leverage?

Here's a little trick to see the *true* list of `match` items. It's a *little*
technical, but works beautifully. Run:

```terminal
php ./bin/console debug:container --tag=netgen_layouts.view_matcher
```

What is this doing? Well, anyone can create a *custom* matcher - like `foo\bar`.
To *do* that, you create a class and give it this tag. By looking for all
services *with* that tag, we can find *all* of the existing matchers in the system.

And... look at that list! Oh, here's an interesting one: `contentful\content_type`.
I bet we can use that. Try it: `contentful\content_type` set to `skill`:

[[[ code('1b98f2ea3f') ]]]

Okay, let's go create the template. Inside `themes/standard/`, instead of
`block/`, this time, create a directory called `item/`... then
`contentful_entry/`, and *then* `skill.html.twig`. Just put some dummy text for
now:

[[[ code('c8dec49b61') ]]]

Ok, *if* this is working, when we refresh, these items - which are Contentful
skills - *should* re-render using our new template. But when we try it...
absolutely *nothing* changes. What happened?

## Wrong Config Order!

Go back to your terminal and run

```terminal
php ./bin/console debug:config netgen_layouts view.item_view
```

again. This all looks good... except for the *order*. This one from Contentful
is on the *top* of the list... and our new ones are at the bottom. And guess what?
When Layouts tries to figure out which template to render, it reads the list
from top to bottom and finds the *first* one that matches: exactly how Symfony's
routing system works.

So, it first looks at `contentful_entry`, sees that the `value_type` *is*
`contentful_entry`... then uses it. It *never* makes it to the
`contentful_entry/skill` at the bottom.

To fix this, we're going to use a fancy *prepend* configuration trick. Let's do that
*next*.
