# Item View

Coming soon...

Okay, team, things are looking good. We created a recipe value type we can query for
them. And we wrote a value converter order to help layouts understand recipes. While
we have not done yet is tell layouts how to render a recipe item. And actually we're
gonna render both the i an admin version of the item, which will show up here as well
as a front end version of the item. How an item, which is the word used for the
things inside of a grid or list are rendered, is called an item view. So to add a new
item view, we're gonna start in the config. So we'll create a new view key here with
item view, and then we're gonna say app. Now, one tricky thing here, I'll make a
comment, is that app means admin. So what we're about to define under the app, key is
going to be the admin view for our recipe item. Next, I'm gonna say recipes app with
a little note here that this key is not important. So unlike other things like latest
recipes or things up here, this inter internal key is actually meaningless. Now down
here we're gonna do two important things. First, we're gonna say template, and we're
gonna tell which template to use. So I'll say NG layouts. That's a pretty standard
directory name to use inside of templates, but you could use anything. And how about
slash admin slash recipe Underscore item, do H gmail twig? The other thing we need to
have down here is a special match key.

What we need to tell layouts is that this is the template that you should use when a
recipe item is being rendered. You can imagine if we had recipes and also blog posts
in layouts. Well, layouts would need to know that this is the template to use for
recipe, but to use a different item template for blog items. So let's do that. We're
gonna say, have a strange syntax on here called item slash value underscore type set
to doctrine underscore recipe, where a doctrine recipe here is referencing the name
of our value type up here. Now this match key, we're gonna see that several more
times in the future, is there are a bunch of built in matchers identified by like
items slash value type or some other string here. And these are used to match to help
our config match up with things in the real world like this config matching up with
the doctrine recipe value type. There are a finite number of these matchers, and
we're gonna see the most important ones along the way. So don't worry too much about
them. One last thing I mention about this configuration here is that under the view
key and layouts, there are a finite number of sub keys that you can do. So we have
item view

And you can actually see them, for example, by running bin console, debug config net.
Again, layouts view. Now this is gonna dump a huge list. Oh, nevermind. Oh, oh. And
actually make sure your templates is template, my bad. Then we're gonna debu config
neck and layouts view. Now this has been going to dump a huge list of configuration.
Don't be overwhelmed. We're gonna look at this stuff in greater detail later. What I
want you to see here is the root keys like block underscore view,

And eventually down here Leia underscore view. So what I wanna tell you is that under
view, there are actually about six different keys you can have here, like item
underscore view and block underscore view. But there are only two that we care about.
The first is item underscore view, where we control how items that go in grid and
list blocks are rendered. The only other key that we are gonna care about here is
block underscore view, which is how you can figure the template for different blocks.
So it's really that simple. Either you are rendering a block and you need the
template for that, or you're rendering an item inside of a block and you need the
template for that. So the configuration can look gigantic over here, but most of
these things are internal that you'll never need to worry about. All right, so we
have our item view for our doctrine recipe for the admin. Let's go create this
template. So in the template's directory, I'll create a new sub directory called ng
layouts slash admin. And then in there a new file called recipe underscore item dot h
channel twig with does it work. And while we're here, let's also do use the dump
functions so we can see what variables we have available to us. All right, so go
back, refresh the layout section, layouts, admin, and

It does work. That is sweet. And importantly, you can see we have several different
variables in here, but the most important one is called item. This is a CMS item from
layouts. And inside of item there is a sub property called object set to our recipe.
So that's how we can give the recipe item dot object. So let's try that over here.
Let's just say curly, curly item.object.name. And how about we'll put it pipe here. I
use a time element, and then item dot object got created at one of the other
properties on recipe. And we'll pipe that to the date filter and say Y dash M dash d.
All right, I'm gonna move over and reload. Got it. So if you can make that fancier,
but that is gonna work for us. All right, cool. Next, let's do the front end item
view.

