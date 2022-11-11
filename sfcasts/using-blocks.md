# Adding More Customized Blocks

We're going to work more on this Recipe List Layout later. But, let's do one more
things right now. Edit that layout. I want to give our admin users the flexibility
to change this *title*. Cool! Let's add a new title block right above... and
enter some text.

Hit "publish and continue editing"... then go to the frontend. What I'm *attempting*
to do is replicate this title, or "hero" area - so that we can *remove* it from our
Twig template. But when we refresh, that doesn't look right yet.

Go over and look at that template. Ok: to replicate this, we need an `h1` tag
wrapped in a `hero-wrapper` div. Right now, layouts is simply rendering an `h1`.
And, by the way, you can, in the title block options, choose between `h1`, `h2`
or `h3`. `h1` is what we need this time.

## Adding a Wrapper Div Column

So: how can we wrap this in a `div` and give it a `hero-wrapper` class? The
answer: add a nifty "column" block... then move the title *into* that column.
Cool right? Finally, when you click on the column, you can add any class you want.
Add `hero-wrapper`.

Let's try it! Hit "publish and continue editing", refresh the frontend and... much
better! What about that text? Copy it, add a new "text" block right below our
"title" and... paste . Publish and continue editing again... try the frontend
again and... look at that! A perfect replica!

To celebrate, over in the template, we can remove that section entirely. The end
result is the *same* as before... except admin users *now* have the ability to
change the text.

## Custom CSS in Layouts or Pre-Made Custom Block Type?

Though, you probably noticed that this *did* require me to be a bit technical: I
had to know the CSS class that the column needed. If the admin users designing your
layouts *are* a bit technical, then this might be no problem. But if your editors
are *less* technical, you could, instead, create a custom block type - like a hero
block - where the user just types in the text and you render this whole thing
*for* them. We're not going to create custom blocks in this tutorial... but that's
mostly because, by the end of the tutorial, you'll know everything you need to
follow the docs for that.

## The Layouts Web Debug Toolbar

All right, back on the front end, layouts comes with its own web debug toolbar icon.
And if you click this, it's pretty cool. We're going to use this a *bunch* of times.
It shows you the layout that was resolved and even the *reason* why it was chosen.

But the *really* useful thing is the "rendered blocks" section. This shows us all
the layouts "blocks" that were rendered to build this page. You can see there's
one called "Twig Block" for the top nav, a "Column", then the "Title", "Text",
"Full View Block" and finally the last "Twig block" for the footer. This is
a great way to see all the different blocks that are being rendered, as well as the
*template* behind each one. Later, we're going to talk about overriding those
templates so we can customize how they look.

## Linking to the Layouts Admin

Back in the layouts admin, Publish the layout to get back to the main page. If you
go to `/admin`, you'll find that our app already has EasyAdmin installed. Let's add
a link from the menu here to Layouts to make life easier. Open
`src/Controller/Admin/DashboardController.php`... and find `configureMenuItems()`.
Add another with `yield MenuItem::linkToUrl()`, call it "Layouts" and give it
some icons: `fas fa-list`. For the url, use `this->generateUrl()` and pass
in the route name, which happens to be `nglayouts_admin_layouts_index`.

Perfect! That's a small detail, but now when we're on `/admin`, we can click "Layouts"
to jump right there.

Okay, status check! We can render Twig blocks and mix in title, text, HTML, Google
Maps and other blocks wherever we want. The more Twig blocks we have in the template,
the more flexibility we have here.

But what about being able to render a collection of recipes from our database, like
the "Latest Recipes" we have on the homepage? That's a big piece of layouts: so let's
start diving into it next.
