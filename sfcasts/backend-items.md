# Backend Items

Our Content Browser is *sort of* working. We can see our one location - we just don't have any results yet. That's because, for whatever location you have selected, the Content Browser calls `getSubItems()` where we need to return all of our results. In this case, that's recipes. If you add *multiple* locations, you could use this `$location` here to return the correct items, but for now, we'll just return *everything*. Let's start by querying for *all* recipes.

To do that, I'm going to go to the top of the class, create a constructor with `privates RecipeRepository $recipeRepository`. Perfect! Then, down here in `getSubItems()`, we'll say `$recipes = $this->recipeRepository` and use that same method from earlier - `->createQueryBuilderOrderedByNewest()`. Below that, we'll `->setFirstResult($offset)`... and `->setMaxResults($limit)`. The Content Browser has pagination built into it (we'll see that in a second), so we'll automatically pass the correct limit and offset for the correct page. We just need to plug it into our query. Now, I'll say `getQuery()` and `getResult()`. Notice that `getSubItems()` returns an `iterable`. This is *actually* supposed to be an iterable of something called an "item interface". So we can't *just* return these recipes. We need to go create one more class in `/src/ContentBrowser`.

Let's create a new PHP class called `RecipeBrowserItem`, which will just be a small wrapper around a recipe for the browser system. This needs to implement `ItemInterface` - the one from "Netgen\ContentBrowser". *Then*, we'll generate the four methods we need for that.

As I mentioned, this is just going to be a little wrapper around our `Recipe` object. So let's add a `__construct()` method with `private Recipe $recipe` argument. For `getValue()`, we're looking for the ID for the recipe, so we'll say `return $this->recipe->getId()`. For `getName()`, we just need something visual we can show - so `$this->recipe->getName()`. Below that, for `isVisible()`, we'll just say `return true`. That's useful if a recipe can be published. We have a similar situation with `isSelectable()`. If you had a set of rules where you wanted to *show* certain recipes but they weren't *selectable* for some reason, you could `return false` for this method. And... we're done! That's all we need.

Over in our backend class, we just need to turn these `recipe` objects into `RecipeBrowserItem` objects. We can do that with an `array_map()`. I'll use that fancy `fn()` syntax again, which will receive a `Recipe $recipe` argument, followed by `=> new RecipeBrowserItem($recipe)`. We'll also add a second argument - `$recipes`. This is a fancy way of saying:

`Loop over all the recipes in the system and, for
each one, create a new RecipeBrowserItem and
return that`.

All right, let's see what this looks like. Refresh the layout, click on our Grid, go back to "Add Items" and... got it! We see *ten* items in here. We *should* have multiple pages, but we don't. That's because we're returning `0` from `getSubItemsCount()`. Let's fix that. I'll steal my query from above... paste that down here... `return` this instead, get rid of `getFirstResult()` and `getMaxResults()`, add `->select('COUNT(recipe.id)')`, and `getSingleScalarResult()` on the bottom. Just like that, if we refresh and open our Content Browser... *we have pages*! I love that!

Now that this is working, what about our search function? It's the last little piece we're missing here. Can we search for stuff? *Absolutely*. We can leverage `search()` and `searchCount()`. This is really simple. We can steal all of the logic from `getSubItems()`, paste this in `search()`, and pass `$searchText` to our QueryBuilder method, which already allows this.

If you want to have a little less repeated code, you could isolate this and add a `private` function at the bottom so you can call that from multiple places. That would be an *excellent* idea. We'll copy the logic from the other count method... paste that into `searchCount()`, and pass that `$searchText` as well. And just like that, if I move over here and try to search... *it works*. That's awesome!

Let's try something else. Select a few items, hit "Confirm" and... it breaks! It still says "Loading" here. If you look down here on the web debug toolbar, we have a 400 error. *Dang*. If we open that up, we see:

`value loader for "doctrine recipe" value type
does not exist`.

There's just *one* final piece that we need; A very simple class called the "value loader". That's *next*.
