# Value Type

Coming soon...

We have a recipe entity and on the front end, a recipe's list page, and we saw that
we can easily transform this page into a layout,

Which

Instantly makes parts of it configurable. But looking at the homepage now, I'm
wondering if we can add more complex blocks beyond just text. Could we, for example,
add a block that dynamically renders the list of recipes? Something kind of similar
to what we have here right now, except instead of adding this via our twig template,
add it via layouts. If we could, we could recreate this, but give our admin users
control over which recipes show here. So if big idea number one for layouts was
allowing layouts to be rearranged and mixed with dynamic content, then big idea
number two is allowing pieces of existing content like recipes to be embedded onto
our page via the layout system. Edit the homepage layout in our list of blocks on the
left, check out list in grid. Let's put right here after our hero, a grid block. Hey,
I'm gonna be talking to myself, but it's totally okay to come in and out. Okay, I'm
doing a recording, but it's a rough recording, so

All right, sounds

Not a problem.

Um, one quick question that I have for you. I was looking at the cabinet down there
and the hinges.

Oh yeah, yeah, for

It. Yeah.

I think we're a little short.

Leah, we are getting the excellent question about hinges. Yeah, so I believe you were
an expert on, I don't have enough hinges yet. We don't have enough hinges yet, but,
But I've sent a message to my IKEA resource. Well, we are acquiring them. Perfect.

Um, is that something that I could pick up at the Lowe's or is that an order thing

To, He has Ikea. Okay. Yeah. Does that, uh, mess up your clients?

No, I think I'll just have to check out these cabinets making sure. Just make sure
that there's nothing

I'm missing. Ah, yeah. Yeah. Cause you wanna go see

It. Yeah, imagine exactly. Yeah, if there's any gaps or what that, All

Right. Good deal.

Uh, yeah, if there's any other questions, I'll let

You know. All right. Thanks man. The grid allows us to add individual items to it,
except that there doesn't appear to be any way to add items to this. So we know that
out of the box we can add lots of cool blocks, like titles, maps, markdown to the
page, but some blocks like list and grid. And also these gallery blocks down here,
which are just basically fancy grids that have some JavaScript behavior attached to
them. Well, these contain dynamic items that are loaded from somewhere else, like our
local database or a CMS or even Sillies if you're using layouts on a sillus project.
All of these things that can be added to these blocks are called value types. And
currently we have zero. If this were a silliest project, we can install a silliest
and layouts integration and instantly be able to select products. The same is true if
you're using IXa cms. So here's our next big goal to add our recipe doctrine entity
as two layouts as a value type so that we can create list and grids containing
recipes. So step one to adding a value type is to tell layouts about it in a config
file. So over in config packages, our neck end layouts very simply, we say value
types

And then we give and we'll say doctrine recipe. This will be the kind of internal
name of the value type, and we'll refer to it in a few places. I'll give it a nice
human friendly name. And then also add for now, manual items. False. We'll talk about
the manual items thing later. Oh, make sure it's manual items, but it's easier to set
it to false to start after just doing this. If we go and refresh our layouts page,
it's okay to reload it and check out our grid block. We have a collection type, and
manual collection is our only option right now. So this still doesn't really seem to
work. I can't change this to anything else. And I also can't select items manually.
So there are two ways to add items to a collection box block. The first is a dynamic
collection where we basically choose from a pre-made query, like we could choose for
from a something called most popular that would automatically query for the most
popular recipes or the latest recipes. The second way to choose items is that you can
manually choose them. So eventually we'll be able to literally go and choose the
exact recipes that we want to go into one of these blocks.

We're gonna start with the first type, the dynamic collection. But we don't even see
dynamic collection as an option here yet because we need to create one of those
pre-made queries. First. Those pre-made queries are called query types. So for
example, for recipe, we could create a query type called most popular and another one
called Latest. How do we create these query types? First up, once again, is back here
in the config file query types and let's say latest recipes. Once again, this is
gonna be an internal key here, and they'll give it a human readable name. Latest
recipes now to find out what to do next, like where we actually define that query
head, revert back and refresh to see a very nice air that tells us what to do next.
Query type handler for latest recipes, query type does not exist. So we need a class
to represent this query type. Awesome. Over the source directory, I'm gonna create a
new layouts directory where I'm gonna organize a lot of our custom layout stuff
inside of here. I'll create a new class called How about latest recipe query type
handler, and then make this implement a query type handler interface. Awesome. I'm
gonna go to code generate or Command N on a Mac and go to implement methods to
implement the four methods that we need.

Awesome. Now, our job in here is pretty simple for build parameters. I'm gonna leave
that empty for a second. We'll talk about that in a minute. But really the most
important thing here is called get values. This is where we're actually going to make
the query for the recipes and return them. So to do that, I'm going to go to the top
of the class, add a construct method, and we'll say private recipe repository, recipe
repository. So I can use my recipe repository to make my queries. Then down and get
values. I'll say return this arrow recipe repository. And I'm gonna call a method on
this that I've already created inside that recipe repository called Create query
builder, ordered by newest. So that creates a query builder, and then we can say, set
first result and pass it offset, and then set max results and pass at limit. You'll
see why these are passed in a second. You can actually control in the admin, uh, how
many it should return and if it should skip the first two, for example. So we feed
those into our query and get query and get results. Perfect. Down here for the count,

We're just gonna do that exact same thing, except we don't need the max results. Our
first results, instead, we're gonna say Select count of recipe.id. I'm using recipe
here because over in our repository class, if we look at that custom method we're
using, I'm using recipes, the alias in my query. So in our query type handler, I'm
just gonna count just recipe.id, and then we're gonna return, get single scaler
results. So a little bit of work here, but it's fairly straightforward. It's kind of
the same query two different times. This time's just getting the count and for is
contextual. I'm going to return false and I need to look up what that does cause I
can't remember. All right, and that's it. This is now a functional query type
handler, but if you go over and refresh, it still doesn't work. We get the same
error. That's because we need to associate this query type handler class with the
latest underscore recipes query type in our config. To do that, we're gonna give this
service a tag, and we can use a really cool new way in from Symphony 6.1 to do this.
It's an attribute that goes above our class

Called Auto Configure Tag, and the name of the tag we need here is called Kin
Underscore Layouts dot query type handler, which you could look that up inside their
documentation. Then we also need to pass this a little array with a type key set to
latest underscore recipes. So this is a key thing. This type here needs to match up
with what we have in our config. So that ties these two things together, and now the
page works and click down on our grid block, we can switch to dynamic collection.
Awesome. I'll hit apply. And everything immediately stops loading. Whenever you have
an air in the admin section, there's a good chance it's gonna show up via ajas call.
So you can see down here on my web debug toolbar, I have a 400 air that just
happened. Let's fix that next by creating what's called a value converter. Then we'll
make our query even smarter.

