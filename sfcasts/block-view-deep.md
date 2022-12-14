# Block Views & Block Definitions

Let's create a layout for our "individual recipe" page so that we can customize
this a bit more. I love that we can create new layouts on the fly, whenever
a page needs to be tweaked.

## Adding and Mapping a New Layout

Add a new layout, choose our favorite Layout 2 and call it "Individual
Recipe Layout". And y'all know the drill at this point. Start by linking the
Header zone... then the Footer zone.

Cool! And then because we're going to be applying this to a normal page that
already exists in Twig, add a "Full View" block, which will render the `body`
block from our template.

Solid start. Hit "Publish"... so we can map this. Add a new mapping, link it to our
"Individual Recipe Layout"... then hit "Details". this time, let's link via the
route name. For the route name, open `src/Controller/RecipeController.php`. Here
it is: `app_recipes_show`. Paste that, hit "Save Changes" and... let's try this!

We shouldn't see any difference yet and... we don't. But we *can* see that it's
using our layout!

Ok, let's spice this page up a bit! Go back to the layouts admin and edit the
"Individual Recipe Layout". Add a new  Grid and change it to a "Dynamic Collection"...
that uses "Contentful Search". Like we did before, load Skills, show the newest
first and limit to 3.

Ok, if we "Publish and continue editing"... then refresh... whoa! It's cool that
we can just put those anywhere now. Though, let's wrap that and container. And...
there we go.

So far, this is all easy. Ready for the complication? I want to customize how this
grid looks: I want to have one *big* recipe on the left and then two smaller recipes
on the right. But I do *not* want to change how the grid looks on *other* parts of
our site, like on the homepage. So the question is how: can we change how this grid
renders on *just* this page?

## The Grid/List View Types

Click on the Grid and go to design tab. It turns out, a Grid is really just a
"List" block that has two "view types": list and grid.

Head over to your terminal and run:

```terminal
php bin/console debug:config netgen_layouts view.block_view
```

Oh, but spell `netgen` correctly. This displays the configuration for how blocks
are rendered. Find the `default` section... then scroll down a bit. Here: we
see the two view types for the list and grid blocks. As I mentioned, it turns out
that these are actually both part of the *same* block type called `list`. They're
just two different *view types*: one called `list` and one called `grid`. When
you switch the "view type" in the layouts admin, you're effectively switching
which *template* is used to render that block.

## Block Definitions

Run that same command, but instead of `view.block_views`, check `block_definitions`:

```terminal-silent
php bin/console debug:config netgen_layouts block_definitions
```

Block definitions is where you define what the blocks actually *are*. So every root
key under this config represents a different block that we can use inside the admin
area. Find the one called `list`: here it is. This defines things like what form
fields are rendered in the admin area *and* what "view types" it has. This has
two: list and grid. Layouts reads *this* config to render the `select` item
of view types in the admin. Then, once we select the view type, it uses the
`block_views` config to know which *template* to render.

Ok, enough deep config and theory. Let's give ourselves a *new* way to render
lists by creating a new view type. That's next.
