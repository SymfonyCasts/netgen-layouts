# How It Works

Coming soon...

To check out the layouts admin section, head to ng layouts slash admin to find a
login form. All right, I've already got set up where you have a user
doggo@barkbite.com. Password wolf. This is an admin user and yet when we log in,
access denied. All right, if you actually click down here on the Web Depot to abar
security icon and go to access decision, you can see that we were deny access cuz it
was looking for something called roll ng layouts Admin. In order to see the layouts
admin area, you need to have this roll. The simplest way to add it is to go config
packages security dot yaml and the role the user we're logged in as right now has
roll admin speaking as roll hierarchy to also give it user role NG layouts admin. And
now if we click back, ta-da. Welcome to the layouts admin section. Whoa. To
understand what layouts does, it's just best to see it in action. Start in this
layout section and let's create a new layout. The first step is it gives you a bunch
of different layouts, types you can choose from. As you'll see, these are less
important than it looks because once you are in a layout, you can really do whatever
you want. But I typically choose layout two.

I'm gonna call this homepage layout. That's just a description for us. Okay, great
layout. And now you are on the layout editor. So pretty simple. What you have over
here on the left side are called blocks. And there's lots of different type of blocks
from simple title blocks to Google maps to more complex things like lists and grids
where we're gonna bring in like collections of dynamic items like uh, featured
recipes. So the idea is that you take one of these blocks, let's add a title block
and you move it onto the page. All right, put some texts into that. And then up here,
we'll just keep simple. We're just gonna hit published layout. Perfect. Now that we
have this new layout, I'm gonna open second tab here, go to the homepage and
absolutely nothing changed. Let me actually rearrange my tabs here. That's because
once you have a layout, you need to map it to a specific page or a set of pages.
That's the layout mapping section. So these are really the two important sections in
the admin area. So here we can add new mapping and then go to details. And then you
have multiple ways that you can map a layout to a specific URL. You could use, for
example, the path info, path info prefix,

Or even the route. So in this case, I'm actually gonna use, we could do path info
with just slash, in this case I'm gonna use route. I'll add target and then I'm gonna
go over here into my source controller, Main controller. And the name of my homepage
is app under Score homepage. So read that over here and hit save Target. We're gonna
talk about some of the other ways you can map targets on here. But the simplest way
is you can basically say I want a specific layout mapped to a specific route or a
specific you url. So we hit save changes and then actually decide which layout this
map's to. We hit link layout and then we'll select our only one homepage layout.
Awesome. So now when we go to the homepage, it should use the homepage layout. What
does that mean? Let's see it refresh. And we still don't see any difference. It's
still our static page. Oh, that's because we have an important installation step. My
bad had head over and find the template for this page, which is templates main
homepage dot htm on that twig. Right now we're extending base dot hgm that twig. So
it's a very traditional setup. We're a base HTL twig and we have block body in the
middle. Now change that to a dynamic variable

Called NG layouts layout template. Now try it Error. That's progress. It says base
page layout, not specified. To run to the page with layouts. Specify the base page
layout with this configure. This will make a little bit, this will make more sense in
a minute, but what it wants us to do is to go into config packages and create a new
file, which can be called anything, but let's call it net. Again, underscore layouts
dot yaml. Inside of here we'll say net. Again underscore layouts. And below that, say
page layout and set this to our base.channel dot twig. What that does will make sense
in a minute. All right, let's refresh again. And hmm, same error. Let's actually make
sure that Symphony saw that file. I'm gonna go over my terminal and clear my cash
should Norman need to do that, but maybe Symphony is not seeing that new config file.
Perfect. Once that's done, let's try it again. Awesome. It works except it's still my
static page. But check out for the first time down here, the web debug toolbar shows
that the homepage layout is being used. So it found the layout, but it's just not
rendering it.

To fix that, we need to do one last thing and then we're gonna back up and we'll see
just how cool this is inside of the base dot htl, that twig right around block body,
say block layout. And then after it end block refresh one more time. And whoa, our
page is gone. Okay. We still have the nav and the footer, which come from above and
below and based at HTML twig, but the actual contents of our page are gone and it's
replaced by our dynamic title block. What Black Magic is this? All right, so listen,
there are faster ways to start with layouts. They have starter projects for normal
symphony apps, Sillies apps and IXa apps. But we did all this set up manually on
purpose. Cause I really want you to understand how layouts works because it's
surprisingly simple. All right, So there's much less magic than you might think. Our
page is still hitting our normal route at homepage, it's still executing our normal
controller and it's still rendering our normal template. But we then extend this nng
layouts dot layout template. Now first, if there was no layout mapped to this
particular page, NG layouts dot layout template is going to resolve to base dot html
that twig. And that's thanks to the config we do here. So any page that doesn't use
layouts, like for example, our recipes page, this hasn't changed at all. We're still
extending base dot html that twig twi. But if layouts does find a layout mapping for
this page,

Then NG layouts dot layout template ex uh, resolves to a core NG layouts template. In
this case it's called Layout two H channel twig. So I'll hit shift shift and it's
this one right here because it doesn't really matter. But this is because we chose a
layout underscore two. What's really important, I want you to see here, this is
pretty simple. It renders our layout. That's what these kind of NG layout render zone
things do. This is actually just referring to the different zones in here. Those
aren't that important. It renders all the layouts into a block called layout. And
then NNG layouts that page layout template that equates resolves to base dot html
twig. So the end result is that our page renders completely normally and it still
extends base dot html twig, but the contents of our layout are rendered into a block
called layout. That's why we didn't see anything at first until we actually included
block layout in base dot html twig. So that's really the best way to think about it.
If you're on a page that doesn't resolve to a layout, everything is entirely the
same. If you are on a page that does resolve to a layout, it simply means that you
have a new block called layout whose contents are equal to whatever you have inside
of that layout.

So at this point,

So as I mentioned earlier, we don't have to add layouts to every page in our site. We
could just add it to the homepage if we wanted to. But every page that we want to
support layouts, we should extend the NG layouts layout template. And the nice thing
is, even if we extend this, nothing happens until we actually map a layout to that
page. So this is just a good idea to use in all of your templates. So I'm gonna go
down here and let's add it to our login template just in case we ever wanna customize
that with layouts. And let's also add it to our recipes list page

And our show. But for a one specific, So if we go over here, you can see when I click
to all recipes or a recipe page, no layout is resolved, but it's now ready to be used
and mapped to a layout if we want to. Now, as interesting as it is that we can now
control the content on the homepage, we uh, kind of did too much. All of our old
content is gone. Is it possible to mix dynamic content with some of the static
content that's inside of our homepage template? Absolutely. And that is a big part of
what makes layouts special.

