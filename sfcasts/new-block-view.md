# New Block View

Coming soon...

Let's create a layout for our individual recipes so that we can customize this page a
bit more. This is the cool thing. We just create new layouts on the fly. So let me go
back, We'll hit new layouts. I'll use my favorite layout too, individual recipe
layout. And y'all know the drill. At this point, we're gonna start by linking our
header and footer zones. Cool. And then because we're gonna be applying this to just
a normal page that we've already built, we can go down here and use this full view,
which renders the uh, twig block called body. So that's a great start. We'll hit
publish. Actually, let's publish normal. So we can go back to the mapping, add a new
mapping, link it to our individual recipe layout and the hit details. And I will just
link this via the path info. Actually, let's use the route on this one. Okay. App
target. And then the name of this route, if you go to source controller, recipe
controller is app recipes show. So I'll put that there. Hit save, Save changes, and
let's try it. We shouldn't see any difference yet and we don't, but we can see that
we are using our lap,

Right? Cool. To spice this page up a little bit, looking a little thin, let's go back
to layouts. Edit our individual recipe layout. And I'm thinking what we can do here
is actually do two columns. Let's put our full view into that column. And then over
here on the right I'm going to do a grid. And we are gonna make this a dynamic grid.
We're gonna pull from content full. And then just like we did before, we'll grab
skills. We'll kind of do the newest ones and we'll limit it to three. All right. If
we publish and continue editing that, then refresh. Whoa, things went crazy easy.
Let's wrap that in a container that looks no better. Okay. Big reset here. All right,
let's go back. Let's go to layouts. Let's edit our individual recipe layout. And
after our full view, let's add a grid and we'll put like, you know, a few, uh, do a
dynamic collection here of content full search. And what we'll do is we'll just list
some skills here. We'll do create it at descending, we'll limit it to three items,
publishing, continue editing and awesome. It's cool that we can just do that and put
that anywhere

Though. Let me do the wrap and container. There we go. It works. But here's the
trick. I wanna customize how this grid looks. I wanna have one big recipe on the left
and then two smaller recipes on the right. But I do not wanna change how the grid
looks on other parts of our site, like on the homepage. So the question is how can we
change J how this grid renders on just this page right now, if you look at a grid and
go to design, a grid block is really just a list block that has two view types list
in grid, we can create a third view type head over your terminal and run bin console,
debug config, nain layouts of course, and then view block view. So this will be the
configuration for how blocks are rendered. Oh, wanna make sure you spell net again
correctly. Perfect. Now let's find the default up here. If you scroll down a little
bit, uh, here we go. Here are the two view types for the list in the grid. As I
mentioned, it turns out that these are actually both part of the same block called
list. They are just two different view types. One called list and one called grid.

And to see where that is all defined, let's run a different con. Run that same
command, but instead of view block views, run block unders definitions. So block
views is where you define how blocks look. Block definitions is where you define what
the blocks are themselves. So every root key on this config is a different block that
we can use inside the admin area. So find one called list. There it is. So name list
and check out under view types. Here are the two view types, list and grid. So here's
the plan. We are gonna add a new view type here called featured grid. Then we're
gonna map that to a template via the block views. So step one is to add the new view
type right here. So over oops.

Okay,

So over in our neck and layouts, config, doesn't matter where, but I'm gonna do it up
here on top. Add block underscore definitions. Now under this config, this is also
where you would create new blocks, but you can also um, modify existing blocks. So
I'm gonna basically repeat the config here list then view types. So list view types,
and then we can create the one we want. So I'm gonna call mine one by two. And then
the only thing we need below is a name one by two featured grid. So just by doing
that, if we go over and refresh our admin area and click down on grid, we have a new
view type we change to it. You can see nothing renders here if we hit publish and
continue editing on the front end. Also, nothing renders if you look in the web
toolbar for layouts and go to the near the bottom, you can see it's rendering invalid
block this block definition list view type one by two featured grid. But the problem
is that we haven't defined a block view for this combination yet, so it just falls
back to invalid block.

All right, so over here under view, we have already created several item views. We're
now down here going to create a block view section. And under here I'm actually gonna
register both an admin block view and a front end block view. Cause you see right now
in the admin area, it just renders nothing. I'm not too worried about the admin view.
I'm actually just gonna reuse the normal grid view. It's close enough. So do that.
I'll use the app key. We know app means admin and then this key does not matter at
all. And then template. And if you looked it up, you'd find that the name of the
template that if you looked in the config is this path right here. Oh, I only need
one as symbol. Then below we're gonna say match. And then we need is block definition
list and block slash view type set to one by two, making sure that this matches what
we have up here under our block definition. And if you didn't know what config used
for the match here, you can use your debug config for block view and find some
similar block and see what kind of match stuff it's using.

All right, so that actually fixes the admin area or should. Beautiful. Then for the
front, for the front end, let's duplicate that entire section. We'll use default for
the front end key. This key is fine, doesn't matter. We use our nng layouts slash
block slash how about list slash one by two underscore list, do H team of that twig.
We can make that path whatever we want. And this stuff down here is still perfect. So
down in our templates directory we have templates, N layouts, themes standard. Then
we have block. Then I'll create a sub directory called list. Then inside of there,
the template one by two list dot html twig. And we'll start by saying one by two.
Sweet. Let's check and see if that works over on the front end. I'll go back refresh
and it does, Here's our tiny little one by two sitting over here. All right, so to
bring that to life. So how can we bring that to life? Well, the first thing I would
look at is probably what the core grid template looks like. So grid H two of that
twig. We want the one from theme standard and it gives you an idea of kind of like
what this normally looks like. And there's a lot of kind of special stuff in here
that you may wanna keep or may not want to keep.

But the most important thing here is this collection html where you loop over this
collections collection identifier. Collection identifier is just the word default. So
loops over collections dot default, and then it includes a template. Template name
and template name is going to be set to grid slash kind of number of columns, HTML,
that twig. So if we have for example, three columns, we can look up three_columns.ht,
that twig. And what this does is just put the diviv and use this NNG layouts render
result. So it's basically looping over something and calling this NG render result on
each one. So I'm gonna use that in here. I'm just gonna paste in some code in here.
So we're doing basically the same thing. We're extending block that H two L that twig
just like the core one does. And then we are looping over that collections do default
adding whatever kind of diviv we need here and then using the engine layout to render
result. And this is what renders the item template. So this is effectively a simpler
way of just re uh, doing that, um, a normal grid. So for you to refresh. Awesome. So
we're kind of back to our normal grid

Now to kind of customize this again, I'm gonna pace over it again. And what I'm doing
here is instead of looping, I'm just rendering the zero result in the first spots,
the one result here and the two result here. So just a little more custom and that
gives me the result I want. Awesome. Now, because we have not included all of the
custom stuff that's inside of here, and for example, the number of columns is
something that we can configure inside of our configuration here that is not relevant
at all to this block. And you can see it's being used in the parent template here,
but we are not using that here. If we wanted to, I go back and run the block
definitions and search for one by two, we could configure this valid parameters thing
here and you can actually, like you could see with list, set that with an exclamation
point to actually remove certain configuration, like number of columns. I won't do
that, but you can see how it's done right here. All right, so heading back to our
site. If you go to the all skills page, things still don't look quite right

On this layout. We're using a grid to render the items, but, but for the all skills
page and just this one situation, I really want each item to render in a different
way. Let's learn how to do that next.

