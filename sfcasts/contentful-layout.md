# Mapping a Layout to Contentful Pages

The Contentful integration we just installed added two things to our site. First,
it added a Layouts integration: new value types, query types, etc so that we
can select our Contentful content in list and grid blocks. Second, it added the
ability for *every* piece of content on Contentful to have its own URL and page
on our site. The second part has *nothing* to do with Layouts.

A minute ago, we used this handy dandy `contentful:routes` command to see that there
should now be a page at the URL `/mashing`. When we went there, it didn't give us
a 404 error, but it *didn't* exactly work. The page is nearly empty.

## Debugging How the Dynamic Contentful Pages Work

Let's see what's going on. Click the Twig icon in the web debug toolbar to find
out what templates are being rendered. Let's see here... if we go down a bit...
it apparently renders `@NetgenLayoutsContentful/contentful/content.html.twig`.
That must be the template for this page! Let's go check it out.

I'll hit Shift+Shift and search for `content.html.twig`: we want the one from
`layouts-contentful`. And... *cool*! This is the template that's rendering
that page. It prints `content.name`... but we never actually *see* that. Ah, that's
because it renders it into a `block` called `content`. This eventually extends
`base.html.twig`... and since our base template never *renders* `block content`, we
see *nothing*. Again, this part of Contentful where you get a URL that renders a
controller, that *then* renders this template... has *nothing* to do with Layouts.
It's just a nice way to expose every piece of Contentful content as a page on our
site.

So, *unrelated* to Layouts, if we wanted to, we could override this template in our
app and customize it to work. We could change it to use `block body` and
leverage this `content` variable, which represents the piece of content, to
render all of the different fields.

But... *hold on* a second. Isn't that the whole point of Layouts? Layouts lets us
build pages dynamically, instead of writing them entirely in Twig. Right now, this
page is *not* linked to a layout. But if we *did* link it, we could start building
the page using data from the matching Contentful Skill, in this case, from the
"Mashing" Skill.

## Mapping a Layout to the Dynamic Page

Head over to our admin section, publish that layout, and then create a *new* layout.
I'll call it "Individual Skill Layout"... and choose "Layout 2". Eventually, we'll
make this look more like "Layout 5"... but we can do that later via the column
blocks. That's one of the reasons why I really like "Layout 2": it's simple enough,
and we can make it more complex *later* with the tools we already have.

Okay, start like normal. Close the web debug toolbar so we can link the header to
the shared header... and our footer to the shared footer. *Awesome*. Then, just
to get rolling, add a Title block, type something... then publish the layout.

## Mapping a Layout to Contentful Entries

Next, we need to map this layout to that page. So far, we've mapped layouts
either by the route name or the URL, also known as the "Path info". We *could*
do that again here. But, as you'll see, what we *really* want to do is use this
layout for *all* Skills pages. In a few minutes, we're going change the URL for
these page from something like `/mashing` to `/skills/mashing`. When we do that
(let me add a new mapping here and hit details), we *could* then use the
"Path info prefix" to map this layout to any URL that starts with `/skills/`.

*But*, one thing that can be added to Layouts is another way to map or resolve which
layout should be used on which page. And, yea! The Contentful bundle added two new
ones: Contentful Entry and Contentful Space. When we go to one of these Contentful
pages, the dynamic route tells Symfony which Contentful Entry - that's the individual
piece of content on Contentful - *and* which Contentful Space that this page maps to.

Thanks to this, we can leverage one of these new targets to match the entry or space.
For example, we could use Contentful Entry to map a specific layout to a specific
*item* on Contentful. Literally, we could say:

> If the current Content is specifically this "Mashing" skill, then use this layout.

*Or*, we could do what I'm going to do: map via the Contentful Space. We only have
one Space, so it's pretty easy. Basically, we're saying:

> If we are on *any* dynamic Contentful page, I want you to map to this layout.

Let's save this... then link this layout to the "Individual skill" layout. Hit
"Confirm" and... good! Head over, refresh and... it works! Yes!

## Mapping to a Specific Content Type

As I mentioned earlier, we actually have *two* types of content in Contentful:
*Skills* and *Advertisements*. Advertisements aren't meant to have their own
page - only skills are. We're going to embed advertisements onto some *existing*
pages a bit later.

Head back to the layout linking details. In addition to the Contentful Space,
we can go down here to a list of conditions and select "Contentful content types".
Conditions are a way to make your matching more specific. Add that condition.
And, this is a bit hard to see, but we can select "Skill" or "Advertisement".
Select "Skill", save changes, and... sweet! Now this will *only* match if we go
to a Contentful URL that is rendering a *skill*.

At the command line, you can see that we *do* have one advertisement... it's this
funny-looking URL. Yes, right now, the advertisement *is* available as a page on
our site. We'll fix that in a few minutes. But, at the very least, if we went to
that weird URL, the page *would* work... but wouldn't match any layout thanks
to our mapping. So, it would basically be blank.

So we *now* have control over Contentful pages. Cool! Though... all we're rendering
is a manual title. Snooze.

Next: Let's make our layout smarter by rendering *real* content from the matching
skill.
