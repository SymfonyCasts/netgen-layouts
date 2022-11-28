# Value Loader + Preview Template

So our content browser was working beautifully... until we selected an item. At
*that* time, it chose to do a strange thing: explode! The Ajax call that failed says:

> Value loader for `doctrine_recipe` value type does not exist.

Okay, to review: we have a custom value type called `doctrine_recipe`. For this,
we have (1): a value converter to convert `Recipe` objects into a format understood
by layouts. (2) a query type to allow us to use dynamic collections. (3) a browser
backend class to help us select manual items. And now (4), we need a value loader
that is able to take the "id" of these manually-selected items and turn them into
`Recipe` objects. Ok, let's do this!

## Creating & Tagging the Value Loader

Inside these `src/Layouts/` directory, create a new class called `RecipeValueLoader`,
make it implement `ValueLoaderInterface` and generate the two methods it needs. These
are pretty simple. But, before we fill them in, go back to the Ajax endpoint, and
refresh to see... the exact same error. Why? Like we've seen with other things, we
need to "associate" this `RecipeValueLoader` to our `doctrine_recipe` value type.
How? No surprise! With a tag. Say `#[AutoconfigureTag()]` and this time it's called
`netgen_layouts.cms_value_loader`. For the second argument, pass `value_type`
set to `doctrine_recipe`.

Perfecto! If we reload now... better! That error is because we haven't actually filled
in the logic yet.

## Adding the Logic

Very simply, we need to take the ID and return the `Recipe` object. To do that,
create a construct that accepts a `RecipeRepository $recipeRepository` argument.
And... let me clean things up.

Now, down here, return `$this->recipeRepository->find()` and pass `$id`.

For `loadByRemoteId()`, which we only need if we're using the import feature to
move content across databases, just `return $this->load($id)`.

And now... the Ajax call works! More importantly, if we refresh the entire layouts
admin... yes! Look at our grid! We have four manual items. That is awesome! We can
reorder these if we want to, we can add more, remove them, whatever.

Try publishing this page and then realoding the homepage. There they are. Though
our latest recipes are now missing. Whoops! I think I accidentally change this to
a dynamic collection also. That's better. And now... cool: everything is back.

## Adding the Preview

So we now have the power to select manual items via the content browser... though
when we originally add the config for all of this, we set a preview template...
but never created it!

Let's open the content browser again. So on the manual grid, hit add items. The
preview template powers the preview mode up here. I we click an item, it shows us
a preview. Well, it *would*... except that we haven't actually *added* that template.

To get the preview working, we need to do two small things. First, open
`RecipeBrowserBackend`. We skipped a few methods in here. For example, we skipped
`getSubLocations()` and `getSubLocationsCount()` because those are only need
if you have a *hierarchy* of locations.

We also skipped `loadItem()`. *This* is used for the preview. It will pass us the
ID of the thing that's loaded and we need to return an `ItemInterface`. So very
simply, we can return a `new RecipeBrowserItem()` - that's the little class that
wraps around the `Recipe` passing `$this->recipeRepository->find($value)`.

Cool! The only other thing we need to do is... actually create the preview template!
In `templates/nglayouts/`, add a new directory called `content_browser`, and inside,
a new file called `recipe_preview.html.twig`. To start, just print out the
`dump()` function.

The cool thing is that we don't even need to refresh. As long as you click on an
item that you haven't *already* clicked on... it works! And look at this `item`
variable: it's an instance of `RecipeBrowserItem`... so an instance of this class
right here/

That's great... except that `RecipeBrowserItem` class doesn't have a way for us
to *get* the actual `Recipe` object. Fortunately, we can fix that ourselves.
After all, this is *our* class. I'll go to Code -> Generate to generate a
`getRecipe()` method.

Now, in the template, we can `item.recipe.name`. And just to make this a bit
fancier, add an `<img` whose `src` is set to `item.recipe.imageUrl` and with an
`alt` attribute.

Once again, we don't need to refresh. If you click on an item that you've already
previewed, it'll load it from memory. But if you click a new one... yeah! There's
our preview. Pretty cool.

Ok, we are *done* with manual items, the content browser and all of this. By the
way, there *is* a way to add more *columns* to this table, like filename, file size,
created date, etc. We're not going to talk about that, but it's totally possible.

Status check: at this point, we have the ability to add a layout to any of our pages,
reorder the content on the page, add title, text, HTML blocks, or even lists and
grids of dynamic recipes. That is a *lot* of power. Next: I want to add *more*
power by making it possible to use the grid and list blocks to add *other* items
to our page... items that do *not* live in our database at all.
