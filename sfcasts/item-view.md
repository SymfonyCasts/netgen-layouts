# Item View Template

Okay, team, things are looking good. We created a `Recipe` "value type", a custom
query to load them, and a value converter to help layouts *understand* our `Recipe`
objects.

What we have *not* done yet is tell Layouts how to *render* a `Recipe` *item*, item
being the word Layouts uses for the individual "things" that grid and list blocks
render. And actually, we need to tell Layouts both how to render an *admin* version
of a recipe item, which will show up here, as well as the more-important frontend
version of the item.

## Adding an Item View

How an item is rendered is called an "item view". To add a *new* item view, we'll
start in the config. Add a `view` key with `item_view` below it and *app* below
that. I'll add a comment, because, in Layouts, `app` means "admin". So what we're
about to define under the `app` key will be the *admin* view for our recipe item.

Next, add `recipes_app`... with a little note to say that this key is *not* important.
Unlike other things, such as `latest_recipes`, this internal key won't be used
*anywhere*. Below, we need two important things. First, `template` - don't include
the "s" like I did - set to a template path, like `nglayouts` - that's a standard
directory name to use for templates, but you could use anything - then, how about
`/admin/recipe_item.html.twig`.

The second important thing is the very special `match` key. We need to tell Layouts
that this is the template that should be used when a *recipe* item is being
rendered. For example, imagine if we had *two* value types: recipes and also blog
posts. Well, layouts would need to know that this is the template to use for
*recipes*... but to use a different item template for blog posts.

## The "match" Config Key

To do that, we'll use a strange syntax: `item\value_type` set to `doctrine_recipe`,
where `doctrine_recipe` references the name of our value type up here.

We're going to see this `match` key several more times in this tutorial. Layouts
has a bunch of built-in "matchers", which are identified by strings like
`item\value_type`. These are used to help match one piece of config, like
this template, with some *other* piece of config, like the `doctrine_recipe` value
type. There are a *finite* number of these matchers, and we're going to see the most
important ones along the way. So don't worry too much about them.

Oh, but let me fix my typo: this should be `template` with no "s".

## The Two View Types: item_view & block_view

Anyways, I want to mention one quick thing about the `view` config key: there is
only a small number of *sub-keys* that go under it.

Find your terminal and run:

```terminal
php bin/console debug:config netgen_layouts view
```

This will dump a huge list of config, but don't be overwhelmed! We'll check out
the important parts of this later. What I want you to look at are the root keys
that go below `view`, like `block_view` and `layout_view`.

It turns out that there are *six* different keys you are allowed to put below the
`view` key in your config, but we only care about *two* of them... which is why
I'm mentioning this. When it comes to customizing your views, it's really quite
simple! The first key we care about is `item_view`, which controls the templates
used when rendering "items": so when rendering things inside of a grid or list.
The only *other* sub-key we care about is `block_view`, which is how you configure
the template used to render different block types, like the `title` block or the
`text` block.

Yup, you're either rendering a *block* and want to customize its template or you're
rendering an item *inside* of a block and you want to customize the template for
that item. So the configuration looks gigantic, but most of these things are internal
and you'll never need to worry about them.

## Creating the Admin Template

Ok: we have our `item_view` for our `doctrine_recipe` for the *admin* area. Let's
go add that template. In the `templates/` directory, create two new sub-directories:
`nglayouts/admin`. And then, a new file called `recipe_item.html.twig`. Inside,
write `Does it work?` and... let's also use the `dump()` function so we can see
what *variables* we have access to.

Alright, head back to your browser, refresh the layouts admin and... it *does*
work! *And*, apparently, we have access to several variables. The most important
is `item`. This is a `CmsItem` object from Layouts... and it has a property
called `object` set to our `Recipe`!

Let's use that! say `{{ item.object.name }}`, then a pipe, and... let's also print
a date: `item.object.createdAt` - one of the other properties on `Recipe` piped
into the `date` filter with `Y-m-d`.

Let's check it! Move over, refresh and... got it! You can make this fancier if
you want, but that'll work for us.

Next: let's create the frontend item view.
