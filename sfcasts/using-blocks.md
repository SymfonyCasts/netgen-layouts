# Adding More Customized Blocks

Coming soon...

All right, we're going to work more on this recipes page later, but if we edit that
layout, let's at least give our admin users a bit more flexibility, like the
flexibility to change this title here. So cool, let's add a new title, lock right
above there and put some texts into there. I'll hit publish and continue editing.
And if you go over and refresh, what I'm trying to do is basically replicate this
title here so then we can remove it from our Twig template. But if you refresh now
that doesn't look right yet. So if we go over and look at that template, you can
see the key is here that we need an h1 wrapped in a hero-rapper div right now this
just gave us an h1, and you can see here on whenever you're using the title, you
can actually change between h1, H two and eighth three. So the h1 is correct


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
We're not going to create custom blocks in this tutorial, but by the end you'll know
you'll ha you'll have plenty to be able to do that yourself.

All right, back on the front end, open up the web two of our, again, I do want to,
we're going to layouts comes with its own web debug toolbar icon. And if you click
this,
it's pretty cool, we're going to check out this many times. It shows you the layout
that
was resolved and even like the reason why that layout was resolved. But the really
important thing here is the rendered blocks. This shows you all the blocks that were
rendered for that page. So you can see there's one called a twig block render. For
the top nav, there's a column block that was rendered. Then the title block, the text
block, the full view block, and finally the twig block. So this is a cool way to kind
of see all the different blocks that how they're being rendered, as well as the
actual template behind them. Later we're going to talk about overriding those
templates
so we can customize how they look. All right, finally, now that we have this nice
admin layouts admin area, I'll hit publish layout. We also, if you go to /admin,
have easy admin installed. Here we go.

So

Let's add a link from easy admin over to our layouts to make life easier. So I'll go
to src/Controller. Admin dashboard controller is what controls those links. Down
here. We'll say yield menu item,:link to url. Let's call it layouts. Give it
some icons, Fas fa-list. And then for the url we can say this->generate
url. And then the name of the route is nng layouts_admin Layouts index.
Perfect. So small detail there, but now I can go to /admin. I can click over to
layouts and I get right here. Okay, so we can now add twig blocks. We can mixin
title text, html, Google Maps videos right inside of here. But what about being able
to embed a collection of, for example, recipes like on our homepage, being able to
maybe recreate this widget and even select dynamically which recipes we want. Let's
start diving into that topic next.
