# Value Loader

Coming soon...

So our content browser was working beautifully, but once we selected an item, things
exploded. The ax call that failed says, Value loader for doc, recipe value type does
not exist. Okay, two review. We have a custom value type called doctrine recipe. For
this, we have one, a value converter to convert recipe objects into a format
understood by layouts. Two, we have a query type to allow us to make automatic
queries or automatic collection or dynamic collections. Three, we created a browser
backend to help us select manual items. And now four, we need a value loader that is
able to take the idea of those selected manual items and turn them into recipe
objects. So inside these source layouts directory, let's create a new class called
Recipe value loader. This will implement a value loader interface, and I will
generate the two methods that we need. These are pretty simple. Now, before we fill
in that method, if you'll go over here and refresh the Ajas endpoint, we get the
exact same air We need to tie this recipe value loader to our doctrine, recipe value
type. How do we do that? No surprise. With a tag. So we'll say auto configured

Tag. And this time it's called neck end underscore layouts dot CMS value loader. And
for the second argument here, it's gonna be value underscore type set to doctrine
underscore recipe. Perfect. All right. If we reload now better, that's just an error
because we haven't actually filled in logic yet. So very simply, we just need to take
the ID and return the recipe object. So as usual, we will create a construct method
with recipe repository. Recipe repository. Let me clean things up here. And then down
here it's return this arrow recipe for repository error, fine, defined by ID and pass
in the id. And for a load by remote id, which you only need if you are importing data
from multiple databases. Need to talk to Eva about that. Just return this arrow load
id. Now the ajas call works. And more importantly, if we refresh the entire layouts
admin. And yes, look at our grid. We have four manual items. That is awesome. We can
reorder these if we want to. We can add more, remove them, whatever. And if we
publish this page and went back over to our homepage, there they are. Though our
latest recipes are now missing.

Oh, I think I actually somehow accidentally change this to a dynamic collection also.
Perfect. There we go. And now there we go. Got everything back. Beautiful. So now we
have the power of manual items, of adding manual items via the content browser, but
when we originally created the content browser, we added this preview template, but
never used it. If you open the content browser again, so on the manual grid, I'll hit
add items that powers this little preview mode up here. So I can click an item here
and it gives me a preview. Right now there is no preview because we haven't actually
added that template. So for this, we need just need two things. The first open up our
recipe browser backend. In other words, one method we skipped. Well, okay, we skipped
get sub locations and get sub locations count, because you only need that if you have
a tree of locations. We only have a single root location. So the only method we
skipped was load item. This is used for the preview. It will passes the ID of the
thing that's loaded, and we need to return an item interface. So very simply, we
could say return new recipe browser item, that little wrapper around the recipe. And
then this arrow recipe repository arrow find value. So that will the recipe browser
item to the preview system. The only other thing we need to do is actually create
that template. So in templates, NG layout, I'll create a new directory called content
underscore browser.

And it's inside there a new file called recipe underscore preview dot html dot twig.
And for now, let's just print out the dumb function. Now the cool thing is I don't
even need to refresh. If I click on one of these, I've already clicked on. There we
go. You can see that. There it is. Awesome. And look at this item is an instance of
our recipe browser item. So inside of here, we have an item variable, which is going
to be equal to this class right here. That's great, except this class doesn't really
have a lot of public methods on it. Fortunately, we can add our own <affirmative>. So
in our template, we're probably gonna want access to the underlying recipe object. So
I'm actually gonna go to code generate and go to getter and add a get recipe method.
Now, in our template, we could say things like item.recipe.name, and just to make
this a little fancier, I'll add an image whose source is set to item dot recipe, dot
image url. And I'll say recipe image for the alt sweet. Again, we don't have to
refresh. If you go to click on any, uh, preview you've already clicked on, it'll just
load the one it already has. But if you click a new one, yeah, there's our preview.
Pretty cool.

All right, we are done with manual items, content, browser and all that. By the way,
if you, there is a way to add more columns to this table. Like you could say file
name, file size, created that. We're not gonna talk about that, but that is totally
possible. So at this point, we have the ability to add a layout to any of our pages,
reorder the content on the page, add title, text, HTML blocks, or even lists and
grids of dynamic recipes. That is a lot of power. So, but next I wanna add more power
by making it possible to use the grid and list blocks to add other items that
actually live on entirely different systems. Bye. Love you. Love you.

