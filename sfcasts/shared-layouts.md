# Shared Layouts

Open up `base.html.twig` and move the `block layout` to be around *everything*.
So, put the start just insert the `body` tag... and the end just inside the *closing*
`body` tag.

If we refresh homepage now... it's destroyed! The top `nav` and `footer` are gone.
Why did I do this? Because I love chaos! Kidding - I did it just because it gives
us the power inside layouts to create *totally* custom pages: even pages *without*
the traditional `navigation` and `footer`, maybe like a temporary landing page for a
promotion.

But let's be honest, 99% of the time, we *will* want the `nav` and `footer`.
No problem, head back over to `base.html.twig`. Remember: adding blocks give us
more flexibility. So, above the navigation, add a new block called `nav`, with
`endblock` after. Then, down here, another called `footer`... and `endblock`.

I bet you know what I'll do next. In the layout admin, we can *now* add a Twig block
to the top that renders `navigation`... then one down here on the bottom. It doesn't
need to be in this last zone... but it makes sense there. Render `footer`.

Let's try it! Hit "publish and continue editing" and... refresh. We are back!

## Creating a Second Layout

Let's create a *second* layout, this time for the `/recipes` page. If you look
at `RecipeController`, you'll see that I already did all the work to query for the
recipes, and pass them into this template. And *in* that template, we loop over
them and render each one, including pagination. And so, we are *definitely* going
to want to include all of this custom work in the new layout.

Back on the admin area, I'll hit "publish layout" as an easy way to get back to the
layout list. Then hit new layout, I'll choose my favorite layout 2 and call it
"Recipes List Layout". Just to start, Add a new block called "Full View"... drag
it anywhere onto the page, whoops! There we go.

What *is* this "Full View". It's nothing special, in fact, it's kind of
redundant! It's nothing more than a "Twig block" that renders the block called
`body`, which we could have easily added by *using* the normal Twig block.

Ok, publish this layout... then go to "Layout Mappings". Add a new one... and this
time I'll link it first... to "Recipes List Layout". Then click "Details". Like
last time, we could map this via the route name. But to see something different,
use "Path Info", which, again, is just a fancy word for the URL, but without
any query parameters. Make it match `/recipes`... "Save Changes" and... sweet!

When we try the page... it looks awesome! Except, whoops, I forgot the nav and
footer! Adding those two blocks to "Recipe List Layout" is easy. But what if, later
we decide that every page should render both the navigation block on top as *well*
as a dynamic banner, maybe for some sale that we're having right now. If that
happened, we would need to edit *every* layout to manually add that new banner.

## Shared Layouts

Fortunately, there's a better way to handle repeated layout elements like this.

Hit "Discard" to get back to the layouts list, then click "Shared Layouts" and
"New Shared Layout". As usual, the layout type doesn't matter much, so I'll use
my normal... then call it "Nav and Footer Layout".

This is not going to be a *real* layout that's linked to any pages. Nope, it's just
going to be a layout that we steal pieces from. So up in the top zone, create a
Twig Block that renders `navigation`... and I'll even label it "Top Nav" to make
it more clear. And then, anywhere in any *other* zone here - you can put it at the
bottom, but you don't have to, add another twig block that renders `footer` and
is *labeled* Footer.

Cool! Hit "Publish Layout". So now we have one shared layout. These are *not* meant
to be mapped to page: they're just meant for us to *use* in other *real*.

Check it out: edit "Recipe List Layout". On the bottom left of the screen, hiding
behind the web debug toolbar - I'll close that temporarily - there's a button
to link a zone with a shared layout zone. Click that, then select the *top* zone,
called the "Header" zone... though that name isn't important.

Now, we can find a shared zone from a shared layout... and we only have one. Hit
"Select Zone" and... that's it! The top zone in our layout will now equal whatever
block or blocks are in the top zone of that shared layout. If we added more stuff
to that zone in the shared layout, it would automatically show up here.

Do that one more time, select the last zone so that the footer definitely shows
up at the bottom, select the shared zone and... done!

Publish that, move over, refresh and... the full page is back! Let's go quickly
repeat that for the "Homepage Layout". Oh, but now this is tricky because I put
*all* of my blocks inside this top zone. Mostly, these zones don't matter, but
in this case, to avoid replacing *all* of this, I'll drag everything except for
the navigation twig block down here. We can fix the order later if we want to.

And now, set the top zone to use the one from the shared layout. Yup! It replaced
what we had there before. And then, down here, also link the *bottom* zone with
the shared layout.

Perfect! Let's check our order of things... which is kind of the beauty of layouts.
If I don't like the order of what's on my page, I can *always* change it. That's
better. Publish the layout, head back to the homepage on the frontend and...
beautiful!

Next: let's make our recipe list page more flexible by allowing this top `h1`
area to be built and customized from inside layouts... instead of it being
hardcoded in the template.
