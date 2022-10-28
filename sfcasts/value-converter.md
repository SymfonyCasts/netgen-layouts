# Value Converter

Coming soon...

As soon as we changed our grid type to use a dynamic collection, it stopped loading.
The air is hiding down here in this Ajax call. The best way to see the air is
actually to click the URL in a new tab. And there we go. Value converter for recipe
type does not exist. Okay, so let's keep scores so far. We created a custom value
type for recipe, which was just this config here. Second, we created a custom query
type, which allows us to load a list of the latest recipes by running the query
inside of the associated class. Now we're getting this value, this value converter
error. A value converter is really simple. It's a class that transformed the
underlying object, so recipe into a format that layouts can understand. So in that
same source layouts directory, let's create a recipe value converter and make this
implement value converter interface, which is great cause I can now go to a co
generate menu or command N on a Mac and hit implement methods to implement the seven
we need. I know that sounds like a lot, but these are really easy to fill in. So
first for supports, layouts is gonna call our value converter. Every time it has a
value, it doesn't understand. So we wanna tell it which type we support. So we
support the object if it's an instance of recipe.

Second, for get value type, we're actually gonna return the string, the internal key
of our value type. So doctrine under school recipe. Next is get id. So we'll
literally just return our id. So object arrow, get id. We're not getting auto
complete on this, but we know that this object is going to be a recipe. And for get
remote, Id just return this arrow, get id object. This is only relevant if you are
trying to move content between databases. I need to look again at what Evo said about
that

Down here for get name. This is just gonna be a human readable name that's going to
be shown for example in the admin area to help out my editor this time. I didn't do
this before, but I'm gonna do a little assert function and say object instance of
recipe if you haven't seen that before. So two things. First, we know that this
object is gonna be a recipe because up in supports we've said that's the only type we
support. So we know this will always be a recipe. If you haven't seen this assert
function before, if object is not instance a recipe, it's a, it will throw an
exception. It's a really easy way to tell your e, your editor or other tools like PHP
Stand that object is definitely an instance of recipe. That's nice because now we're
gonna get an auto completion. When we say return, object, arrow, get name. Then next
is get is visible. Let's return true. If your recipes could be, for example,
published or unpublished, then you could check that here and return true or false.
And finally, object, return object. I know that seems a little bit silly, but this is
a way for you to like change your recipe after it's loaded if you wanted to add more
stuff on it. Not something that we need to do.

Sweet. So this time, unlike the query type handler auto configuration takes care of
everything. We don't need to add a manual tag up here. So if we move over, I'll try
refreshing this age X endpoint first and that works. Let's go over here and refresh
our layouts admin page again. And whoa, check it out. You can see a bunch of items on
our grid. If we click it, we can see our items loading below here. That's awesome.
Now notice we only ever had to choose dynamic collection. We didn't actually ever
have to choose that we were specifically using our latest recipes query type. That's
simply because it's the only query type in our system. If we added a second query
type in our system, we would see another drop down here where we could slack between
maybe latest recipes and most popular recipes. So this is using our latest recipes
query type to get all 25 of these results. So for example, if we're trying to
recreate this area here, we only want four. So let's limit the number of items to
four. Awesome. All right, let's see what this looks like on the front end. I'm hit
publish and continue editing

And once that saves, we'll go over and refresh. It should show up right here and we
see absolutely nothing, or at least it seems like that at first. But if you zoom in
here a little bit, let's see, you can see we have a diviv here call that has a class
VT grid on it and inside a row and inside of that we see a bunch of empty diffs. If
you ignore this clear fix here we have 1, 2, 3, 4. So the items are rendering there,

They're just rendering empty. And that makes sense. We haven't told layouts how
recipe items should be rendered yet. More on that in a few minutes. But before we get
there, I wanna make our query type a bit fancier. So notice there's this one method
called it build parameters that we ignored. This is a way for us to add extra form
fields to allow our query to be modified by the admin. For example, if we wanted to,
we could add like a search term so that we could return the latest recipes that match
a certain term. So to do that, we could say builder, add term and they'll say text
type and get the one from neck and layouts, parameters, types. There's several
different built in form field types that you can use. Perfect with just that, we go
and refresh our admin now and click down here on grid. Sweet. We've got a big new box
here. Of course, if we type anything on here, nothing happens. And it also has a
really weird label. So let's fix that label first. It's got this weird label so that
um, we can translate it. So what we do, this is in the translations directory that's
being translated through a domain called NNG layouts. So we can create a file called
nng layouts dot e n.dot

Yaml. By the way, a really easy way to know that that's the domain you need to use is
to leverage. No, nevermind, I'm not gonna talk about that. And so here I'll paste and
we'll set that to search term. Now if we refresh that right now and click it works,
for some reason you're don't see the translation there, try clearing your cash now to
actually make that do something, modify the query over in our query type handler,
this query object that we're passed from layouts that contains this value. So our
create query builder ordered by newest actually already has an optional search term
that we can pass into it. So here we can pass query arrow, get parameter, and then
type, type and term and then get value. So I'm gonna copy that and we'll repeat that
down here for our count. Awesome, let's try that. Refresh the layouts area, go down
here and sweet. Consider there's no items. Cause I have this silly search term if
I'll clear it out. We get everything. All right. Just type couple letters into there.
You can see it changing below. Awesome. All right, Next, let's teach layouts how to
render the recipe items both on the front end as well as the back end preview.

