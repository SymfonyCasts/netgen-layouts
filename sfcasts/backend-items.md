# Content Browser: Returning the Items

Our Content Browser is *sort of* working. We can see our one location... we just
don't have any results yet. That's because, for whatever location is selected,
the Content Browser calls `getSubItems()`. Here, we need to return all of our results.
In this case, all of our recipes. If you had *multiple* locations, like recipes
divided into categories, we could use the `$location` variable to return the subset.
But we'll query and return *all* recipes.

## Querying in getSubItems()

To do that, go to the top of the class and create a constructor with
`private RecipeRepository $recipeRepository`.

Then, down here in `getSubItems()`, say `$recipes = $this->recipeRepository` and
use that same method from earlier: `->createQueryBuilderOrderedByNewest()`. Below
add `->setFirstResult($offset)`... and `->setMaxResults($limit)`. The Content
Browser has pagination built into it. It passes us the offset and limit for whatever
page the user is on, we plug it into the query, and everyone is happy. Finish this
with `getQuery()` and `getResult()`.

Notice that `getSubItems()` returns an `iterable`... *actually* it's supposed to
be an iterable of something called an `ItemInterface`. So we can't *just* return
these `Recipe` objects.

## Creating the ItemInterface Wrapper Class

Instead, in `src/ContentBrowser/`, create another class called, how about
`RecipeBrowserItem`. Make this implement `ItemInterface` - the one from
`Netgen\ContentBrowser` - then generate the four methods it needs.

This class will actually be a tiny wrapper *around* a `Recipe` object. Watch: add
a `__construct()` method with `private Recipe $recipe`. Now, for `getValue()`,
this should return the "identifier", so `return $this->recipe->getId()`.
For `getName()`, we just need something visual we can show, like
`$this->recipe->getName()`. And for `isVisible()`, `return true`. That's useful if
a `Recipe` could be published or unpublished. We have a similar situation with
`isSelectable()`. If you had a set of rules where you wanted to *show* certain recipes
but they weren't *selectable*, you could `return false` here.

And... we're done! That was easy!

Back over in our backend class, we need to turn these `Recipe` objects into
`RecipeBrowserItem` objects. We can do that with `array_map()`. I'll use that
fancy `fn()` syntax again, which will receive a `Recipe $recipe` argument, followed
by `=> new RecipeBrowserItem($recipe)`. For the second arg, pass `$recipes`.

This is a fancy way of saying:

> Loop over all the recipes in the system, create a new `RecipeBrowserItem` for
> each one, and return that new array of items.

All right, let's see what this looks like! Refresh the layout, click on the Grid, go
back to "Add Items" and... got it! We see *ten* items!

## Implementing getSubItemsCount()

But we *should* have multiple pages. Ah, that's because we're still returning `0`
from `getSubItemsCount()`. Let's fix that. Steal the query from above... paste,
return this, remove `setFirstResult()` and `setMaxResults()`,
add `->select('COUNT(recipe.id)')`, and then call `getSingleScalarResult()`
at the bottom.

And just like that, if we refresh the page... and open the Content Browser...
*we have pages*!

## Adding the Search Functionality

Ok, but could we search for recipes? *Absolutely*. We can leverage `search()` and
`searchCount()`. This is simple. Steal all of the logic from `getSubItems()`, paste
into `search()` and pass `$searchText` to the QueryBuilder method, which already
allows this argument.

If you want to have a little less code duplication, you could isolate this into
a `private` method at the bottom.

Also copy the logic from the other count method... paste that into `searchCount()`,
and pass that `$searchText` as well.

And just like that, if we move over here and try to search... *it works*. That's
awesome!

Alright - select a few items, hit "Confirm" and... oh now! It breaks! It still says
"Loading". If you look down on the web debug toolbar, we have a 400 error.
*Dang*. If we open that up, we see:

> value loader for "doctrine recipe" value type does not exist.

There's just *one* final piece we need; A very simple class called the "value
loader". That's *next*.
