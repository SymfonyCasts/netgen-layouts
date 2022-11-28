# Frontend Item View

Time to create the `Recipe` item view for the *frontend*. This starts almost exactly
the same. In fact, copy the admin config... then paste. In Layouts, we know that
the `app` key means the "admin" section. And, it turns out, `default` is used to
mean the *frontend*:

[[[ code('960b2697f2') ]]]

## Frontend (default) item_view & Template

Once again, this internal name isn't important, for the template, use the same path
but `frontend`... and keep `match` exactly the same:

[[[ code('065646168b') ]]]

I love when things are boring and easy! Let's go create that template. In `nglayouts/`,
make the `frontend/` directory... and inside, `recipe_item.html.twig`.

Layouts will pass this the *same* variables as the admin item template. This means
we can, once again, use `{{ item.object }}` to access our `Recipe` object. Let's print
the `name` key to see if things are working:

[[[ code('55cca23705') ]]]

And... they *are* working. It's alive!

## Checking Templates in the Twig Profiler

One of my favorite things to do when I start working with templates inside Layouts
is to click the Twig item on the web debug toolbar. Here, we can actually *see* how
Layouts is rendering. Yup, it renders `layout_2.html.twig`... then starts rendering
each zone. It renders our `navigation` block, the `hero` block, then, eventually
down here, the grid. You can see it's using `grid/3_columns.html.twig`.
This is something we can control in the admin area. Click the grid. On the right,
we're looking at the "Content" tab. But there's also a "Design" tab. Change this
to "4 columns"... and I'll hit "Publish and continue editing".

If we refreshed now and reloaded the Twig profiler, we would see it rendering
`4_columns.html.twig`. Then, hey! Inside of each column, it renders *our*
`recipe_item.html.twig`. This is just really cool to see, and we're going to
look at this again later when we talk about *overriding* core templates.

## Bootstrap 4 CSS

One thing I *do* need to mention is that our app is using Bootstrap version 4,
not Bootstrap 5. The reason is because, right now, the grid template
renders Bootstrap version *4* markup. If you wanted to use Bootstrap 5, that's
totally possible, but you would need to override these columns templates - like
`4_columns.html.twig` - to tweak the classes. Overriding core templates is actually
*super* easy, and we'll talk about how to do it soon.

## Customizing our Frontend Template

Ok, let's bring this frontend view to life! Open up the homepage template:
`main/homepage.html.twig`... and scroll up to where we loop over the latest recipes.
Perfect. What I basically want to do is *steal* the markup for one of these
recipe tiles... then paste that into the frontend template:

[[[ code('bece7a5480') ]]]

Now we just need to tweak some variables: instead of `recipe.slug`, it needs
to be `item.object.slug`. I'll do a find and replace: replace `recipe.` with
`item.object.`:

[[[ code('63495a185e') ]]]

## Wrapping Blocks in a Container

Nice! Let's see if that worked. Move over, refresh... and it did! That looks like
the frontend. We're awesome! Except, it's missing the "gutter" that we have in
the original. Inspect element. Ah, the difference is that the original columns
were inside of a `container` div, which adds the margin. In the new code, we
*are* inside of a row... but not a `container`.

To fix this in Layouts, let's add our favorite utility block: a column! Move the
grid *into* that column. Then, we *could* add a CSS class like we did before in
the hero area. But instead, take a shortcut and check "Wrap in container".

Hit "Publish and continue editing" and refresh. Whoops - wrong page. Head back
to the homepage and... it looks great! It's now inside of an element with a
`container` class!

This "Wrap in container" is *super* handy: it literally adds an extra `div`
around your block with `class="container"` and *every* block supports this. Heck,
we didn't even *need* a column: we could have just checked the "Wrap in container"
on the grid itself.

The only reason I put this inside of a *column* is so we can *also* add the
"Latest Recipes" header there too. Drag a new "Title" block into the column.
Get outta here Apple! Inside, type "Latest Recipes" and change to an `h2`.

Hit our favorite "Publish and continue editing", refresh and... even closer! We
just need to center this... and maybe give it a little top margin. Add two classes
to the title: `text-center` and `my-5` for some vertical margin: both classes come
from Bootstrap. I'm just repeating the classes that my designer was already using
in the template.

Publish that... and when we try it... it matches *exactly*. Woo! But *now*, we
have full control over the recipes inside! We could change to a different query,
change the *number* of items or, in a little while, we could choose to *manually*
select the *exact* recipes to show. We can also now embed lists and grids of
recipes *anywhere* we want on the site.

## Cleanup!

To celebrate, remove the *entire* `latest_recipes` Twig block:

[[[ code('7860e6d918') ]]]

And, up in `MainController`, delete the query, the variable, the repository
argument and the `use` statement:

[[[ code('db45591402') ]]]

When we refresh, we have just *one* "Latest Recipes" section coming from our dynamic
block. Oh, but notice in the layouts admin, we're *still* rendering the
`latest_recipes` block... even though it doesn't exist anymore! Layouts is pretty
forgiving to admin users: instead of throwing an error, it simply renders
nothing.

But let's delete that... then publish... and take one last look. I love it!

Next: now that we have this grid inside of layouts, we can do some cool stuff with
it, like enabling Ajax-powered pagination.
