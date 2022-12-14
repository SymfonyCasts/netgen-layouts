# Custom Block View

Coming soon...

So here's the plan. We are gonna
add a new view type here called featured grid. Then we're gonna map that to a template
via the block views. So step one is to add the new view type right here. So over
oop



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
