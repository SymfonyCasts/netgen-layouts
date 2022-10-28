# Content Browser

Coming soon...

So we can now embed lists or grids or thumb galleries of recipes to any layout in our
system dynamically. That's just super cool. And we can always create more query types
so that we could, for example, choose between latest recipes or most popular recipes.
But what about being able to select manually select recipes? Like maybe we want to
feature four specific recipes in the home beach in a Lays area on the grid. If you
change the collection type, we can change to manual collection. No, when I do that,
it actually breaks, but if we refresh, okay, it's working again, manual collection.
But you can see here I can't actually select any items to allow your items in our
case recipes to be selected manually. First we need to allow that in the config. So
you remember earlier when we created the value type, we said manual items false.
Let's change that to manual items. True. And now when we dry it, we get an air neck
and content browser backend for doc and recipe value type does not exist. Yep. We
need to implement a class that helps layouts browse our recipes. That's called a
content browser.

Adding a content browser is actually done by a completely different bundle, which you
can even use outside of neck end layouts if you ever need a really nice interface for
selecting items. Since this is done in a different bundle, I'm actually gonna, I
don't have to but I'm gonna configure this with a different configuration file called
that. Again, content browser dot yaml. It's inside of here. Set the root key to that
content browser cuz it's called net. Again content browser bundle. And inside of here
we get to describe all of the different manual things that we wanna be able to brows
browse. We do that under an item types key. And then for the root key here we are
gonna grab the value type, internal name doctrine underscore recipe. So that needs to
match. And then we'll give us a name, say recipes with a cute strawberry icon. And
the only other thing we need in here is a preview key with a template sub key. And
I'll set that the engine layouts slash How about content browser slash recipe
underscore preview html. Do twig we did. Oh, and make sure you call spelled template
correctly. So we're setting this preview template because the configuration forces us
to, but we're actually gonna worry about creating that template later.

All right, when we, if we refresh now same error, that's because we need a back end
class that will connect to this new item type. So this is a, creating a backend is a
simple process, but it does require creating a few different classes. So in the
source directory I'm gonna create a new directory called content browser. And inside
of there we're gonna create a new PHP class called recipe browser backend. This needs
to implement a backend interface, the one from net gun browser backend. Then I'll go
to code generate or command and on Mac to implement the nine methods that are needed.
Don't worry, it's not nearly as bad as it looks. Finally, to link this backend to the
item type that we have in our config, we need to give this service a class. So we're
gonna do this the same way that we did earlier with our query type. We're gonna use
auto configured tags. In fact, I'll steal this auto configured tag since I'm here.
Paste that. Add the use statement for it this time. The tag name is net gun
underscore content underscore browser dot backend. And then instead of type, it's
item underscore typed. And this is gonna be set to the key we have in here. So
doctrine underscore recipe, paste that there.

All right, before we refresh, now the air is gone. So I'm going to temporarily add a
new grid up here. I'm gonna choose manual collection. And now check this out because
we have a back end, we have an add items button and when we click that it fails,
which shouldn't be too surprising since our back end is completely empty still. If
you wanna see the exact air, you could open up the ax call. All right. So the way
that the browser works is, is in these methods we almost describe a tree structure
like a file system. So locations are kind of like directories and items are gonna be
the recipes inside those directories. Now we're gonna keep things really simple and
instead of having like different categories of recipes that you can choose from,
we're just gonna have a single location called recipes and everything will be under
that. You'll see what this looks like in the content browser in a few minutes. So to
get this all working inside our source content browser directory, we need to create a
class that uh, represents a location. So I'm gonna call it browser root location.
This is really not that important. It's kind of low level plumbing that you just need
to have.

Make this implement location interface. Then I will implement the three methods that
I need. So again, we're gonna have this class just represent the one and only route
to location. So forget location id, you can return anything. I'm gonna return zero.
You'll see how that's used in a second. Or get name. This is gonna be what's gonna be
displayed in the admin section. I'll say all and for get parent id because if return
null, if you have a more complex system with like multiple sort of sub directories,
you can have um, a hierarchy of locations. All right, let's update our back end to
uses. So get sections is gonna be called right in the very beginning to figure out
all the different kind of route directories that you have in your backend browser.
For us it's gonna be literally returning new browser route location, an array with
just that one thing. Now as soon as this loads, it's going to grab the idea of that
make another age x request to get more information about it. So this is only gonna be
called one time where ID is zero. And what we need to do is actually return that same
location. So I'll say if Id equals equals zero,

Then return new browser route location. Now I notice I'm using zero in strings here,
whereas before it's an integer. That's because this will be parsed by uh, parsed and
used in JavaScript. So by the time it gets back to our server, it will be a string.
So just watch out for that. And down here I can, we can throw a new um, invalid
argument exception in case we get down here, we shouldn't. It says invalid location
and then we'll pass the id. Perfect. So that handles our one location. Now for
everything else, I'm just going to return the simplest thing possible. So for load
item. So for load item, actually lead that empty for a moment. Forget sub locations,
return empty array, get sub locations, count return zero, get sub items, return an
empty array, get sub item count return zero. And finally for search return and MT
array and search count return zero. Phew. We're talk about all of that in a minute,
but this backend is class is at least somewhat functional. So if we refresh the admin
area now click on our grid, go to add items, it loads, say hello to the content
browser. Of course there's no items in it, but you can see are all here. This is our
one location and inside that location and currently there are no items to get items
in here. We need to return them from get sub items.

Let's do that next.

