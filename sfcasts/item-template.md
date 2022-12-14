# Contentful Item Template

Our "item" template for skills *is* now being used! So, let's finish it!

We already know what we want the skills to look like... so let's go steal that
from `templates/main/homepage.html.twig`. Find the `featured_skills` block, copy
what *one* of those skills looks like, and paste that into `skill.html.twig`.
Let's also add `dump(item.object)` at the top. We've created an item template
before, so we know `item.object` *should* give us the underlying "object" that
represents this Contentful entry.

If we head over and refresh... *awesome*! This dumps a `ContentfulEntry` object.
And, though you can't see it from here, this class has a `get()` method we can
use to read *any* of the underlying data from Contentful.

For skills, if we dig a little... we have fields like `title` and `shortDescription`.
Let's use those! For example, in the `<h3>`, say `{{ item.object.get('title') }}`.
And... yup! That rendered the title.

For the `<img src="">`, replace the `asset()` stuff with `item.object.get('image')`,
followed by `.file.url`, which is specific to Contentful. Also fill in the `alt`
attribute with `item.object.get('title')`.

The *last* thing we need to update is the URL. But, hmm. If we had created a
"skill show" page in Symfony, we could use the Twig path function and link to
that route! However, each skill page is *actually* created via a dynamic route
thanks to the Contentful bundle. And, to create those routes, it's using the
CMF routing system.

So, to link, we need to use that system. Say `path('cmf_routing_object')` and
pass `_route_object` set to `item.object`.

If you were using Sylius or Ibexa CMS, you would use some function from *their* system
to create this link: this is specific to the CMF routing system.

If we head over and try that... yes! And if we click on it... double yes!

Let's celebrate by removing the `dump()`... and deleting the `featured_skills`
block from our homepage template. We won't need that at all anymore. We can even
remake this `<h2>` inside of the layouts admin. Let's do that: add a Title block
called "Featured Skills", make that "Heading 2"... and give it that same CSS class:
`text-center mb-4`.

The Grid is already in a container... but we want *all* of this in a container.
So add a Column, wrap *that* in a Container, move the Grid and Title blocks inside
of it... then we won't need a Container right *there* anymore. Delete the
"Features Skills block"... then finally hit "Publish and continue editing". While
we're waiting, delete that block also from the Twig template.

And now... yes! It looks perfect!

## The Advertisement Item View

Okay, while we're talking about item views, let's customize the item template for
our *other* content model inside of Contentful: *Advertisement*. We're only rendering
that in *one* place, on a specific skill page right over... *here*. Let's go check
that out.

Publish this layout... then edit the *individual* skill layout. Earlier, we
used the Contentful Entry Field block to render the `advertisements` field, which
is a "referenced entity". Yup, if you modify a skill in Contentful, down on the
bottom, the "Advertisement" field allows you to choose from the Advertisements
in our system.

Click on the Twig icon of the web debug toolbar... search for "item", and scroll
down.. No surprise: it's using the standard Contentful "item" template. And, good
new, we already know how to override that.

Head over to our configuration, copy `contentful_entry/skill` section, and paste
it below. Then replace `skill` with `ad` for the section name, `template` and
finally set the `content_type` to `advertisement`... because that's the internal
name of that type in Contentful.

Ok! Let's go add that template. In `contentful_entry`, create a new file called
`ad.html.twig`... and then just add some text: `Advertisement`.

Moment of truth. Head back over, refresh... we got it! That was easy!

For the *real* template contents, I'll just paste some in. Once again, we'll use
`item.object.get()` to read the `url` field. There's also an `image` field and a
`shortText` field. And now... *we've got it*!

Next: What if we wanted to create a Grid of items on our site, but make that
*one* Grid look different than *every* other grid on the site? We can do that by
creating an extra "block view" for an existing block.
