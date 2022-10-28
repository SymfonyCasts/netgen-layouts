# Ajax

Coming soon...

Now that we're rendering these recipe items via the grid component, check out what we
can do. So make sure you're clicked onto the grid component. Go to the design tab and
then click Enable Page Nation. Then you can choose between pager style with links for
page 1, 2, 3, 4, or just a load more button style. Let's use that one. All right, hit
publish and continue editing. Then once that saves refresh to see absolutely nothing.
So the Page Nation is powered via JavaScript and Ajax and we don't see anything
because we haven't included the JavaScript needed onto the page yet. So adding it is
pretty easy. Go to templates base on H two L Twig. And up here in the head area we're
going to include two templates. The first one is at neck end layout standard slash
page underscore head H team on that twig. And we're also gonna pass a little full
true. So basically this is gonna bring in CSS and JavaScript that supports these
gallery items down here. Now I'm not gonna talk too much about these gallery blocks,
but these are basically different types of lists and grids except that they have
JavaScript to make them sliders or thumb galleries.

So this brings in the CSS and JavaScript for those, as well as a small grid CSS file
to render grids on your page in case you don't have Bootstrap. The Full True tells it
to actually bring in J Qu itself as well as two other JavaScript libraries called
Magee Popup and Swiper, which help with those gallery blocks.

So notice, so I didn't say anything about Page Nation. So technically if you're not
using one of those gallery blocks, you could avoid bringing this one in entirely if
you want to. But I'll leave it. The one we want for Page Nation, I'll paste this is
neck, Neck end layout slash page head. And then we don't need the full true there.
It's a little simpler. This one's dead simple. It brings in a little bit of CSS and a
little bit of JavaScript to Power Ajas Page Nation. And these are the only two
templates that you'll ever need to bring in to import JavaScript and css. So now in
re refresh we gotta a little load more link and when we click, it explodes with a 500
call. Whoops. If we open that up in a new tab, we can see no template match could be
found for item view and content Ajax. So this is really cool. No surprise. When we
click that Ajax call, when we click load More, it's gonna basically load the next
tiles via Ajax. So it's gonna be rendering the item view for those. But when you load
things via Ajax, you might think that that would load the front end template here.
But there's actually a different section specifically for Ajax. So I'm gonna copy the
front end section entirely here and change it to Ajax,

But I'm not gonna change anything else because on the Ajax I just want use the normal
front end template. So now if we refresh that agent call, it renders them, let's
refresh the actual front end and it that's uh, the messaged is collection dot pager
dot load more. So I'm gonna copy that, go over into our engine layouts. I paste, it
actually changes the format. That's fine. We could have done it that way, but I like
it this way. And I'll say Show more and then on the front end, beautiful. Let's make
one other change actually to some css. So no surprise one layouts renders this. It's
got some, it's got some classes around it and it's got some basic CSS and we can
totally override that if we want to. So I'm gonna go up into my assets styles app,
that CSS file. As a reminder, I'm writing, we pack OnCore the background, so this
will automatically rebuild when I change into these files. And down at the bottom
I'll just paste in a little bit of CSS to give us a little more margin and no border.
Now we're here. Beautiful. Got it. So free Ajax and we can customize how things look.
Pretty sweet. Now at this point, because are are able to render grids and lists of
recipes, we could go into the layout for the all recipes page and actually replace
this hard coded HTML here, which is actually coming from templates recipes list that
HTL twig, we can actually remove this and replace it with a list block.

The only problem is it wouldn't look quite right because these would be, instead of
rendering like these, they would use our item template and they would render like
this.

Now, we could fix that by creating a second way to render recipe items. That is
totally possible, but unless we're going to need to reuse the way this looks on
multiple parts in our sites, there's not a real benefit to doing that. Having that
rendering right here in Twig in this one spot is perfectly fine. Later we will learn
how we could create multiple item templates so that for example, when you have a grid
or a list of items, you could actually control which item template you want to use
when you're rendering them. But we'll do that later. All right, next, let's improve
our recipe system by making it possible to manually select items.

