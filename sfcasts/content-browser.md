# Content Browser

We can *now* embed lists, grids, or thumb galleries of recipes into *any* layout
dynamically. That's *super* cool. And we could always create more query types to,
for example, choose between the *latest* recipes or *most popular* recipes.

But what about being able to *manually* select recipes? Maybe we want to feature
four *specific* recipes on the homepage. In the layouts area, on the grid, if you
change the Collection type, we *can* switch to "Manual collection". But then...
we can't actually select any items.

## Enabling Manual Items in the Config

To allow items (in our case, *recipes*) to be selected manually, we first need
to allow that in the config. Earlier, when we created the `value_types` key, we
set `manual_items` to `false`. Change that to `true`.

And now, when we try the page, we're greeted with an error!

> Netgen Content Browser backend for `doctrine_recipe` value type does not exist

Yep! We need to implement a class that helps Layouts *browse* our recipes. That's
called a "content browser".

## Configuring the "item type" in NetgenContentBrowserBundle

Adding a content browser is actually done by a *completely* different bundle, which
you can use *outside* of Netgen Layouts. It's handy if you need a nice interface
for browsing and selecting items.

Since the content browser lives in a different bundle, it's not *required*, but I'm
going to configure this with a new config file called `netgen_content_browser.yaml`.
Inside, set the root key to `netgen_content_browser` to configure the
"NetgenContentBrowserBundle".

Inside of *this*, we get to describe all of the different "manual things" that we
want to be able to browse. To do that, add an `item_types` key, and, for the first
item, go grab the value type's internal name - `doctrine_recipe` - so that these
match, paste, then give this a name. How about... `Recipes` with a cute strawberry
icon.

The only other thing we need here is a `preview` key with a `template` sub-key,
which I'll set to `nglayouts/content_browser/recipe_preview.html.twig`. Oh! And make
sure you spell "template" correctly. Whoops! Anyways, we're setting this `preview`
`template` because the configuration *requires* us to... but we'll worry about
*creating* that template later.

## Creating the Backend Class

If we head over and refresh... we get the *same* error. That's because we need a
backend class that will *connect* to this new item type. Creating a backend is a
simple process, but it *does* require a few different classes.

In the `src/` directory, let's create a new directory called `ContentBrowser/`...
and inside of that, a PHP class called `RecipeBrowserBackend`. This needs
to implement `BackendInterface`: the one from `Netgen\ContentBrowser\Backend`.
Then, go to Code Generate (or "command" + "N" on a Mac) to implement the *nine*
methods this needs! Don't worry: it's not as bad as it looks.

*Finally*, to *link* this backend class to the item type in our config, we need
to give this service a tag. We'll do this the same way we did earlier for the
query type: with `AutoconfigureTag`. In fact, I'll steal this `AutoconfigureTag`
since I'm here... paste that... and add the `use` statement for it. This time, the
tag name is `netgen_content_browser.backend`, and instead of `type`, use
`item_type`. Set this to the key we have in the config: `doctrine_recipe`. Paste
and... cool!

*This* time when we refresh... the error is *gone*. Let's temporarily add a new Grid
to the layout... and choose "Manual collection". Now... check it out! Because we
have a backend, we see an "Add Items" button! And when we click it... it *fails*.
That shouldn't be too surprising... since our backend class is still completely empty.
If you want to see the *exact* error, you could open up the AJAX call.

## Creating the Location Class

The content browser system works like this: in these methods, we describe a "tree
structure", kind of like a filesystem. "Locations" are like directories and "items"
are like the "files", or, in our case, the individual recipes.

We're going to keep things really simple. Instead of having different "directories"
or "categories" of recipes that you can browse, we're going to have a single
directory - or "location" - that *all* recipes will live inside. You'll see what
this looks like in the UI in a few minutes.

To get this working, inside `src/ContentBrowser/`, we need to create a class that
represents a location. I'll call it `BrowserRootLocation`. This class... isn't super
interesting: it's just some low-level plumbing that we *must* have. Make this
implement `LocationInterface`, and below, generate the three methods we need.

Again, this class will represent the one and only "location". So for
`getLocationId()`, we can return *anything*. I'm going to `return 0`. You'll see
how that's used in a second. For `getName()`, this is what will be displayed in the
admin section. I'll `return 'All'`. And for `getParentId()`, `return null`.

If you have a more complex system with multiple sub-directories, you could create a
*hierarchy* of locations.

All right, let's update our backend class to use this. Up here, `getSections()`
will be called as *soon* as the user opens up the content browser. Our job is to
return all of the root "directories" - or "locations". We have just one:
`return [new BrowserRootLocation()]`.

After this is called, the content browser will call `getLocationId()` on each
one and make an AJAX request to get more information about them. For us, this will
happen just *one* time where the id is `0`. It looks weird, but all we need to do
is return that same location: `if ($id === '0')`, then
`return new BrowserRootLocation()`.

Notice I'm using `'0'` as a string, but... in `getLocationId()` we returned
an integer. That's because the id will be passed into JavaScript and used in an
Ajax call. By the time it gets here, it'll be a string. A small detail to keep in
mind.

At the end, just in case `throw` a `new \InvalidArgumentException()` and pass
a message about an invalid location.

Ok! So our backend has *one* location. For the other methods, let's return the
*simplest* thing possible. Leave `loadItem()` empty for a moment, for
`getSubLocations()`, `return []`, for `getSubLocationsCount()`, `return 0`, for
`getSubItems()`, `return []`, for `getSubItemsCount()`, `return 0`, for `search()`,
`return []`... and *finally*, for `searchCount()`, `return 0`.

*Phew*... We'll talk about each of those methods later. *But* our backend class is
at least *somewhat* functional now.

If we refresh the admin area again... click on our grid, and go to "Add Items"...
*it loads*! Say "hello" to the content browser! It's currently *empty*, but you can
see the "All", which is from our *one* location. There are no items inside yet...
because we need to return them from `getSubItems()`. Let's do that *next*
