# Ajax Pagination & CSS/JS

Now that we're rendering these recipe items via the grid block type, check out what
we can do. Click the grid, go to the design tab and then check
"Enable Pagination". Then you can choose between a pager style with page links,
like 1, 2, 3 and 4, or just a "load more" button. Let's use that one.

All right, hit publish and continue editing. Then... once that saves, refresh to
see... absolutely nothing! The pagination is powered entirely via JavaScript and
Ajax. And we don't *see* anything because we haven't, yet, included the JavaScript
needed onto our page.

## Including the CSS/JS Templates

Adding it is pretty easy. Go to `templates/base.html.twig`. Up here in the `head`
area, we're going to include two templates. The first is:
`@NetgenLayoutsStandard/page_head.html.twig`... and pass this an extra
variable: `full: true`.

This will load the CSS and JavaScript that support these gallery items down here.
I'm not gonna talk about these gallery blocks in this tutorial, but they're
basically like a list or grid block, except that they have JavaScript to turn them
into sliders or thumb galleries.

So this includes the CSS and JavaScript for those, as well as a small grid CSS file
to help render the grid columns on your page in case you don't have Bootstrap. The
`full: true` tells it to bring in jQuery as well as two other JavaScript libraries
called `magnific-popup` and `swiper`. All of these are needed for those gallery
blocks.

So, yes, if you're not using one of those gallery blocks, you could avoid
including this file entirely. But I'll leave it.

But notice, I didn't say anything about pagination. For that, we need to include
a second template. Copy this line, paste, remove the word `Standard` and this doesn't
need the `full` variable.

This template is dead simple: it brings in a tiny bit of CSS and a little bit of
JavaScript to power Ajax pagination. And these are the *only* two templates that
you'll ever need to include for Layouts JavaScript and CSS.

## Adding the "ajax" Item Template

Refresh and... there it is! And when we click the new link... it explodes
with a 500 error! Whoops.

Open that URL in a new tab. Interesting:

> No template match could be found for `item_view` and content `ajax`.

When we click "Load More", no surprise, that Ajax call renders the next recipe
*items*. You might *think* that this would re-use our "frontend" item view template.
But... there's actually a different section specifically for when content is rendered
via Ajax. Copy the `default` frontend section entirely, paste, then change it to
`ajax`.

Nothing else needs to change: when we're in `ajax` mode, use the normal frontend
template.

*Now*, if we refresh the Ajax endpoint... it works! Reload the homepage and click
"Load More". That is *so* nice!

## Translating the Pagination Button

Though, *minor* thing, our designers *really* want to use the text "Show More".
No problem: *everything* that Layouts renders is processed through the translator.
Click the translation icon on the web debug toolbar. Oh, there it is! Apparently
the translation key is `collection.pager_load_more`.

Copy that... then go open our translation file - `nglayouts.en.yaml` - and paste.
My editor changed the format... which actually *would* work... but I'll go back
to the flatter format. Set this to "Show More", spin over and... we got it!

## CSS Changes to Pagination

Ok, *one* more change to make our designers happy. Inspect element on the button.
Layouts adds a bunch of classes, which are styled via that CSS we included.
*And*, of course, we can override that if needed.

In our editor, open `assets/styles/app.css`. As a reminder, we're already
running Webpack Encore in the background. So, if we change this file, that change
will automatically be rebuilt and used on the frontend.

At the bottom, I'll paste some CSS to give that button more margin but no border.

Flip back over, refresh and... our designers are happy.

So thanks to layouts, we get *free* Ajax pagination, which we can pretty easily
customize. That's sweet.

## Grids vs Custom Twig Content

At this point, because we're able to render grids and lists of recipes, we *could*
go into the "Recipes List Layout" and *replace* this hardcoded HTML, which
comes from the template: `templates/recipes/list.html.twig`. Yup, we could, in
theory, remove this and replace it with a list block.

The only problem... is that it wouldn't look quite right. Instead of rendering
like it does now, Layouts would use our *item* template: so each item would look
like it does on the homepage.

Now, we *can* fix that by creating a *second* way to render recipe items, and
we *will* talk about that later. But I'm bringing this up for an important
reason. Unless we're planning to reuse this list and how it looks on *other*
pages on our site, there's no huge benefit to doing the work to convert it
into something that we can render via Layouts. Since it's only used here, rendering
it via Twig is perfectly fine.

Next: let's improve the recipe system by making it possible to *manually* select
items.
