# Adding Lists: Value Type

We have a `Recipe` entity and, on the frontend, a page that lists the recipes. We
also saw how easy it is to create a layout, which instantly makes parts of this
page configurable.

## Adding Lists of Existing Content via Layouts?

But now, looking at the homepage, I'm wondering if we can add more complex blocks,
beyond just text. Could we, for example, add a block that renders a list of recipes?
Something similar to what we have here right now... except instead of adding this
via a Twig block, it's added entirely via layouts by an admin user? And, to go
further, could we even let the admin user *choose* which recipes to show here?

Totally! If the *first* big idea of Layouts is allowing Twig template blocks to be
rearranged and mixed with dynamic content, then the *second* big idea is allowing
pieces of *existing* content - like recipes from our database - to be embedded onto
our page by admin users.

How? Edit the Homepage Layout. In the blocks on the left, check out this one called
"Grid". Add that after our "Hero" Twig block. The Grid allows us to add individual
*items* to it... which could be *anything*. But, I don't see a way to do that!

Ok, so we know that a lot of blocks, like titles, maps, markdown, etc can be added
to our pages in layouts out-of-the-box with no extra setup work. But the purpose
of *some* blocks - like List, Grid, and the Gallery blocks down here (which are
just fancy grids that have JavaScript behavior attached to them) - is to render
a collection of "items" that are loaded from *somewhere else*, like our local
database, CMS, or even your Sylius store. The "things" or "items" we can add to
these blocks are called "value types". And... we currently have *zero*. If this
were a Sylius project, we could install the Sylius and Layouts integration and
instantly be able to select products. The same is true if you're using Ibexa CMS.

## Adding a Value Type

So here's our next big goal: to add our `Recipe` Doctrine entity as a "value
type" in layouts so that we can create lists and grids containing recipes.

Step one to adding a value type is to tell Layouts about it in a config file. Over
in `config/packages/netgen_layouts.yaml`, very simply, say `value_types`, and below
that, `doctrine_recipe `. This is the *internal name* of the value type, and
we'll refer to it in a few places. Give it a human-friendly `name` -
`Recipe` - and for now, set `manual_items` to `false`... and make sure that has
an "s" on the end:

[[[ code('8d1f76144f') ]]]

We'll talk about `manual_items` more later, but it's easier to set this to `false`
to start.

Head over, refresh our layouts page (it's okay to reload it)... and check out
our Grid block! There's a new "Collection type" field and "Manual collection" is
our only option right now. So... this still doesn't seem to be working. I can't change
this to anything else... and I also can't select items manually.

## Dynamic vs Manual Queries

There are *two* ways to add items to one of these "collection" blocks. The first
is a *dynamic* collection where we choose from a pre-made query. We could choose
a "Most Popular" query that would query for the most popular recipes or a "latest
recipes" query, to give two examples. The *second* way to choose items is
*manually*: the admin user literally selects which they want from a list.

## Adding a Query Type

We're going to start with the first type: the *dynamic* collection. We don't see
"Dynamic collection" as an option yet because we need to create one of those
pre-made queries first. Those pre-made queries are called `query_types`. We could,
for example, create a query type for `Recipe` called "Most Popular" and another
one called "Latest".

How do we create those? Head back to the config file, add `query_types` and below
that, let's say `latest_recipes`. Once again, this is just an "internal name".
Also give it a human-readable `name`: `Latest Recipes`:

[[[ code('b74adc5964') ]]]

So... what do we do now? If we head back and refresh... we get a very nice error
that *tells* us what to do next:

> Query type handler for `latest_recipes` query type does not exist.

It's trying to tell us that we need to build a *class* that represent this query
type! Let's do it!

## The Query Type Handler Class

Over in the `src/` directory, I'm going to create a new `Layouts/` directory: we'll
organize a lot of our custom Layouts stuff inside here. Then add a new PHP class
called... how about `LatestRecipeQueryTypeHandler`. Make this implement
`QueryTypeHandlerInterface`:

[[[ code('babd282473') ]]]

Then go to "Code Generate" (or `Command`+`N` on a Mac), and select "Implement methods"
to add the four we need:

[[[ code('c04981c1d2') ]]]

Nice! Let's see... I'll leave `buildParameters()` empty for a minute, but we'll come
back to it soon:

[[[ code('39c0dab62c') ]]]

The most important method is `getValues()`. This is where we'll load and return
the "items". If our recipes were stored on an API, we would make an API request
here to fetch those. But since they're in our local database, we'll query for them.

To do that, go to the top of the class, add a `__construct()` method with
`private RecipeRepository $recipeRepository`:

[[[ code('53ab55cc70') ]]]

Then, down in `getValues()`, `return $this->recipeRepository`... and use a method
that I already created inside of `RecipeRepository` called
`->createQueryBuilderOrderedByNewest()`. Also add `->setFirstResult($offset)`
and `->setMaxResults($limit)`. The admin user will be able to choose *how* many
items to show and they can even *skip* some. And so, Layouts passes us those
values as `$limit` and `$offset`... and we use them in our query. Finish with
`->getQuery()` and `->getResult()`:

[[[ code('5d32df906d') ]]]

Perfect! Below, for `getCount()`, let's do the exact same thing... except we don't
need `->setMaxResults()` or `->setFirstResult()`. Instead, add
`->select('COUNT(recipe.id)')`:

[[[ code('00d69e8605') ]]]

I'm using `recipe` because, over in `RecipeRepository`... if we look at the custom
method, it uses `recipe` as the alias in the query:

[[[ code('b21de44ac4') ]]]

After that, update `->getResult()` to be `->getSingleScalarResult()`:

[[[ code('ec0d670017') ]]]

Phew! That was a bit of work, but fairly straightforward. Oh, and for
`isContextual()`, `return false`:

[[[ code('fff5255415') ]]]

*We* won't need it, but this method is kinda cool. If you return `true`, then
you can read information from the current page to *change* the query - like
if you were on a "category" page and needed to list only products *in* that category.

## Tagging the Query Type Handler Class

Anyways, that's *it*. This is now a functional query type handler! But if you go
over and refresh... it *still* doesn't work. We get the *same* error. That's because
we need to *associate* this query type handler class with the `latest_recipes` query
type in our config. To do that, we need to give the service a tag... and there's
a really cool way to do this thanks to Symfony 6.1.

Above the class, add an attribute called `#[AutoconfigureTag()]`. The name of the
tag we need is `netgen_layouts.query_type_handler`: this is straight out of the
documentation. We also need to pass an array with a `type` key set to
`latest_recipes`:

[[[ code('83a1b6448c') ]]]

This `type` must match what we have in our config:

[[[ code('4195bc4644') ]]]

It ties the two together.

And now... the page *works*! If we click on our Grid block... we can switch to
"Dynamic collection". *Awesome*! I'll hit Apply and... everything immediately stops
loading!

When you have an error in the admin section, there's a good chance it'll show up
via an AJAX call. Often, Layouts will *show* you the error in a modal. But if it
doesn't, no worries: just look down here on the web debug toolbar. Yup! We have
a 400 error.

Let's fix that next by creating a *value converter*. Then we'll make our query
*even smarter*.
