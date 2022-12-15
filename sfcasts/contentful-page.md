# Building the Contentful Page

We now have full control over how the Contentful pages render. That's thanks to the
"Individual Skill layout" that we mapped to all Contentful "Skill" pages.

But... all we have is this manual `h1` title. How can we render the real *data*
for whichever Contentful Skill we're viewing?

First, on Contentful's site, if I navigate to "Content model" and click on "Skill",
you can see that every Skill has 5 fields... and each field has an internal name.
It's... almost easier to see this via the JSON preview. Here we go. So there's a
"Title" field, it's internal name is `title`, "Short Description", "Technique", and
a few other like "Image" and "Advertisement". Advertisement is actually a link to
that *other* type of content.

## Using the "Contentful Entry Field" Block Type

Anyways, what we *really* want to do up here is print the *skill's* title in the
`h1`. Fortunately, that *is* possible, thanks to a new *block* type that the
Contentful bundle added. It's here at the bottom: "Contentful entry field".

This allows us to render a single field from whatever Contentful entry is currently
being rendered. Let's try it! Then delete the old `h1`.

The new block has one super important option: field identifier. Set that
to the internal name of the field: `title`. And make this an `h1`. As usual,
the block label is optional, but I'll include it.

Cool! Hit publish and continue editing, move over and... yes! It's dynamic. If we
go to the URL for some *other* skill, like `/basic-chop`, that works too!

## Adding the Fancy Hero Area

So let's get fancier. Add a column... and move this title inside. Can you guess
what I'm about to do? Give the column that same `hero-wrapper` class that we used
earlier. And you know what else? Each skill has a "Short description". Lets add
another entry field block right below.

Notice that one option for this block is "view type". We're going to talk more about
that soon, but this should match the "type" of the content that you're pulling from
Contentful. So far, both `title` and this `shortDescription` are "string" types.
Leave this as `div`.

Testing timer! Hit "Publish and continue editing". And... let's see how it looks.
I love that! Let's add more!

## Adding a Contentful Image

Every skill has an image. Inside of that same hero column, add another Contentful
entry block at the bottom. This will be called `image`... and the *type* is
"referenced assets". You *do* need to set a width and height. Let's do 200 by 200.
Publish that... refresh and... we're on a roll!

*One* last thing: rendering the skill content *below* everything. By the way, we
could render this in the same zone... or use the zone below. Zones don't matter
much in most case.

## Using a 2-Column Block

But let's make this spot more interesting. I want to render the skill content
on the left and an advertisement on the right. To do that, for the first time,
use a 2-column block. Set this to 66, 33 so that the left side takes up most
of the space. Add a title to the left side and make it an `h3` with the text
"The Technique:". Below, drag over a contentful entry field.

This one... if I go check my fields... is called `technique` and it holds rich text.
If you modified it in Contentful, you'd see a rich text editor... and the final
value is HTML. So, type `technique`, keep it as a `div` and select `Richtext`.

## Rendering a Related Contentful Entry

Finally, on the right side, add one more Contentful entry field. Look back at the
content model for Skills... and scroll down a bit. The one we want to use is
called `advertisement`, and this is a "Referenced entry" type. Yup, if you edited
a skill, you would choose the Advertisement from the list of Advertisements we have
in Contentful. It's like a database relation.

Anyways, enter `advertisement`, hit "Publish and continue editing"... refresh
and... ok! *Sort* of awesome. We need a container to bring those in. We already
have a column, so click "Wrap in container".

And... yea... though this could also use some top margin. On that same column,
add a class: `my-3`. Publish this... and reload. *So* much better! Though, the
Advertisement is just printing a URL... not rendering an ad. That's because
Contentful doesn't *know* how to render the "Advertisement" content type. We'll
help it soon.

But first, let's fix our Skill pages by prefixing all URLs with `/skills`.
