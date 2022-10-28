# Backend Items

Coming soon...

Our content browser is sort of working. We can see our one location, we just have no
results. That's because for whatever location you have selected, the content browser
calls gets sub items where we need to return all of our results. Recipes. In this
case, if you add multiple locations, you could use this location here to return the
correct items, but we'll just return everything. So let's start by querying for all
recipes. So to do that I'm gonna go to the top of the class, create a constructor
with privates, Recipe repository. Recipe repository. Perfect. Then down here in get
sub items, we'll say recipes equals this arrow recipe repository arrow. And we use
that same method from earlier. Create query builder ordered by newest and then we'll
set set first result offset in set max results limit. Uh, the content browser has
pagenation built into it as we'll see in a second. So we'll automatically pass us the
correct limit and offset for the correct page. We just need to plug it into our query
now as they get query and get results. But notice get sub items is supposed to return
returns in Iterable, but this is actually supposed to be an iterable of something
called an item interface. So we can't just return these recipes. We need to go create
one more class in source content browser.

We'll create a recipe browser item, which will just be a small wrapper around a
recipe for the browser system. This needs to implement item interface, the one from
net gun content browser. Then I will generate the four methods. I'll generate the
four methods we need for that. So what we're gonna do here is we're actually, as I
mentioned, this is just gonna be a little wrapper around a our recipe object. So
we're actually gonna add a construct method with a private recipe recipe argument
then and get value. What it wants here is actually the idea of the recipe. So we'll
say return this arrow, recipe arrow get, Id get name, just something visual that it
can show. So this arrow recipe arrow get name and then is visible. Again, if recipes
could be published, you might use that Here we'll just say return. True and is
selectable is kind of a similar thing. If you had some rules where you wanted to show
certain recipes but they weren't selectable for some reason, you could return false
from this method. Yeah, that's all we need. So back in our back end class, we just
did return these recipe objects into recipe browser item objects. And we can do, do
that with a nice array map.

I use that fancy FN syntax. Again, let you receive a recipe argument. I'll say equal
arrow, new recipe, BR browser item, and pass in that recipe. And then for the second
argument of a RAM app, we're gonna be doing this on recipe. So fancy way of saying
loop over all the recipes in the system and for each one create a new recipe browser
item and then we can return that. All right, let's see what this looks like. Refresh
the layout, add area area, click on our grid, go back to ad items and got it. Yes, we
see 10 items in here. We should have multiple pages and we don't, but that's because
we're returning zero from get sub items count. So let's that, I'll kind of steal my
query from above. Paste that down here, return that results, get rid of the max
results and first results, select count of recipe.id and then call. Get single scaler
result on the bottom. And just like that, if we refresh and get our content browser
back open, we have pages. I love that. All right, what about search? It's kinda the
last little piece we're missing inside of here. Can we search for stuff? Absolutely.
There's a search and search count for that. So this is really simple. In our case,

We can steal all the logic from get sub items past, sit down and search, and then
just pass search text to our query builder method, which already allows a search
text. If you wanna have a little less repeated code, you could isolate this and do a
private function at the bottom and call that from multiple places. That would be an
excellent idea. Also, copy the logic from the other account method. Paste that in a
search count and pass that search text as well. So just like that, I go over here in
search. It works. That's awesome. All right, so how about this? Let's select a few
items. Hit confirm and it breaks. It still says loading here. You can see down here a
400 air dang. So just one last P. If we open that up. We see value loader for DR. And
recipe does not exist. So we have just one last piece that we need. A very simple
class call the value loader. That's next.

