# Using Blocks

Coming soon...

Open up based on HTML twig and watch this. I'm gonna move this block layout around
everything. So I'm gonna put it, just insert inside the start of the body and put the
end just inside the closing body tag. If we refresh homepage now it's destroyed
because the top nav and footer are gone. Why did I do this? Because it gives us the
power over here in layouts to create, to create layouts that look super different,
that even have a different nav and footer. You can imagine using this to dynamically
build some sort of temporary promotion page. But let's be honest, 99% of the time we
will want the nav, Uh, the nav and footer, no problem. Back over in our base
template. Remember blocks basically give us flexibility. So let's create a new block
called navigation and at the end of it we'll say N block and then a block down here.
Block footer N block. And I'm sure you already know what I'm gonna do. We can now add
a TWI block to the top called navigation and then one down here on the bottom.
Doesn't really matter that it doesn't necessarily need to be in this last zone, but
kind of makes sense. And I'll call it footer.

We publish and continue editing now and refresh. We are back. All right, let's create
a our second layout this time for the slash recipes page. So one thing about the in
recipe controller, our controller already goes to all the trouble to query for the
recipes, pass 'em into this template. And in that template we loop over all those
recipes and render them including Page Nation. And so I'm gonna wanna include that on
the new page. So let's go here. I'll hit publish layout. It's an easy way to get back
to the layout list. Let's hit new layout. I'll choose my favorite layout. Layout too.
Now I'll call this recipes list layout. And just to start, I'm actually gonna put the
this go down and put this full view block and we'll just put that summer on the page.
Whoops. There we go. Get out of there. Now the full view, I was a little confused by
this at first. The full view is nothing more than the twig block that renders the
block called Body. So if you don't wanna use full view, you don't have to, you can
just use Twig block everywhere. Call it Body and you're good. All right, let's
publish this layout. Then go to layout mappings and then map that to our page. So
it'll say add new layout. I'll actually link the layout first this time. So recipes
list layout.

And then here I'll go to details to give it the conditions when this would match last
time, we could use the route. But this case I'll use Path info. Path Info is just the
clean part of the URL without parameters. So we're gonna have us match slash recipes,
save changes and sweet. You can see nothing change cause we're you could, it mapped
the layout and it looks awesome except, whoops, I forgot the navigation and the
footer. So adding the those two blocks to recipe list layout is easy. But what if
later we decide that every page should render both the navigation block on top as
well as a dynamic banner for some sale that we're having right now. We would have to
go and do every single layout we have and manually add that new like banner up here.
So a better way to handle this, I'll add discard is the greatest shared layout. This
is purely just a little shortcut. So I'm gonna hit new shared layout. Doesn't matter.
Once again, a hot layout too. Let's call it nav and footer layout. This is not gonna
be a real layout, it's just gonna be a layout that we steal pieces from. So up on in
the top zone, I'm gonna create a twig block here for navigation and we'll even call
it top nav to make it more clear. And then anywhere in any other zone here, you can
put it on the bottom, but you don't have to. So I'll actually put it right here in
the second spot

Wheel render the footer nav, the footer, uh, block. And then I'll hit polished
layout. So now we have one share layout. These are not meant to be mapped, they're
just meant for us to use from layouts here. So for example, I'll wrap edit the
recipes list layout,

And there's actually a little button down here, you can't really see it with the web
D above two on the way. So I'm gonna close that temporarily. This here it says link
zone with shared layout zone. So you can select one of your zones. So I'll select the
header zone and then you can find your shared zone shared layout. We only have one
and you can select that zone. And that's it. So now the top zone here is gonna equal
whatever the zone is on that shared layout. So if we added more stuff to that zone
and the shared layout, it would automatically show up here. And then we can do the
same thing down here for the last thing. So I'll go down a footer here so that our
footer is definitely in the bottom zone. And then I'll select that zone here and
perfect, I'll publish that. Go over and refresh. And we have our layout back. Let's
go ahead and repeat that inside of homepage layout. Now the only tricky thing is that
I put all of my blocks inside of this top zone here, which I'm now going to um,
replace with the linked version. So I'm actually gonna drag this stuff

Down here. There we go. Perfect. We can fix the order later if we want to. And now I
will replace length, the top zone with the one from our shared. So you can see it
replaced what we had there. And then down here we replaced the bottom one with the
one from the shared. Perfect. So let's check our order here. It doesn't really
matter. Order we have things in, that's the beauty of it. That's the order we had
things in originally. Let's publish that layout. Go back to the homepage and
beautiful. All right, we're gonna work more on this recipes page later, but if we
edit that layout, let's at least give our admin users a bit more flexibility, like
the flexibility to change this title here. So cool, let's add a new title, lock right
above there and put some texts into there. I'll hit publish and continue editing. And
if you go over and refresh, what I'm trying to do is basically replicate this title
here so then we can remove it from our Twig template. But if you refresh now that
doesn't look right yet. So if we go over and look at that template, you can see the
key is here that we need an H one wrapped in a hero dash rapper div right now this
just gave us an H one, and you can see here on whenever you're using the title, you
can actually change between H one, H two and eighth three. So the H one is correct.

So how do we wrap this in another diviv and give it that hero rapper class? The
answer to that is to add a nifty column inside of here. So we can add a column, move
the title into the column, and then the column, we can get that of the CSS class hero
dash wrapper. Now at publish publishing continu editing refresh. And much better, we
can even kind of grab this text here and let's add a little text block. We'll put it
right inside of that column, add the text publishing can continue saving. And now
look at that. Beautiful. So now we can go in here and remove that from our template.
So now we only have one of them and the user has the ability to change that. Now you
can see it did require to me to be a little bit technical here, I had to know the CSS
class needed to be on this column. Um, if you have tech, that might not be a problem
for you. If it is, you could actually create a custom block, like a hero block where
the user just typed in the hero and text and you rendered this whole thing for them.
We're not gonna create custom blocks in this tutorial, but by the end you'll know
you'll ha you'll have plenty to be able to do that yourself.

All right, back on the front end, open up the web two of our, again, I do wanna,
we're gonna layouts comes with its own web debug toolbar icon. And if you click this,
it's pretty cool, we're gonna check out this many times. It shows you the layout that
was resolved and even like the reason why that layout was resolved. But the really
important thing here is the rendered blocks. This shows you all the blocks that were
rendered for that page. So you can see there's one called a twig block render. For
the top nav, there's a column block that was rendered. Then the title block, the text
block, the full view block, and finally the twig block. So this is a cool way to kind
of see all the different blocks that how they're being rendered, as well as the
actual template behind them. Later we're gonna talk about overriding those templates
so we can customize how they look. All right, finally, now that we have this nice
admin layouts admin area, I'll hit publish layout. We also, if you go to slash admin,
have easy admin installed. Here we go.

So

Let's add a link from easy admin over to our layouts to make life easier. So I'll go
to source controller. Admin dashboard controller is what controls those links. Down
here. We'll say yield menu item, colon link to url. Let's call it layouts. Give it
some icons, Fas fa dash list. And then for the url we can say this arrow generate
url. And then the name of the route is nng layouts underscore admin Layouts index.
Perfect. So small detail there, but now I can go to slash admin. I can click over to
layouts and I get right here. Okay, so we can now add twig blocks. We can mix in
title text, html, Google Maps videos right inside of here. But what about being able
to embed a collection of, for example, recipes like on our homepage, being able to
maybe recreate this widget and even select dynamically which recipes we want. Let's
start diving into that topic next.

