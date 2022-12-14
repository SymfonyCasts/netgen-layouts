# The Skills List Page + A Grid of Skills

Thanks to the Contentful integration, in addition to our `doctrine_recipe` value
type, we now have a *second* value type that can load things from Contentful.
This means that we can render lists and grids of *skills* inside any layout,
like over here on our homepage.

Let's try it! Publish this layout... then edit the Homepage Layout. Oh, and we
can delete this old grid we were playing with earlier.

Below, we're currently rendering the `featured_skills` Twig block. But in reality,
if you looked at our template, those are totally hardcoded!

## Adding A Grid of Skills

No problem! Add a Grid block... and set it to a "Manual Collection". Check this
out! We can now choose between manually selecting "Contentful entries" or recipes!
And when we click "Add Items", the content browser already works!

Select a few of these... good... then publish this. Refresh. Um... ok! They *do*
render... but just the title. Good start. To make this a *tiny* bit better, go
to the "Design" tab... and wrap this in a container.

That should, at least, give us some gutters. There we go. Ultimately, we want
these to render like the hardcoded skills below them. And we're going to work on
that in a few minutes.

## Adding a /skills Page

But before we get there, what about a `/skills` page that lists *all* of the skills?
Well, the Contentful integration did *not* give us this URL. But, no problem! We
can create it ourselves in Symfony!

Well, actually, we *could* do this entirely in Contentful! We could create a
"Page" content type, create a "Skills" page, which could become `/skills`, *then*
map that to a Layout. This is the type of thing you'd normally do when you have
a CMS at your fingertips

But we'll create this page the manual way. After all, Layouts is really about helping
organize how *existing* pages look... it's not really about adding *dynamic* pages.
That's a job for a CMS.

In your editor, open up `src/Controller/MainController.php`. Copy the `homepage()`
action, paste, change to `/skills`, call it `app_skills` and rename the *method*
to `skills()`. For the template, render `main/skills.html.twig`.

Now, in the `templates/main/` directory, create that: `skills.html.twig`. Let's
start with the *smallest* possible thing: extend `nglayouts.layoutTemplate`.

Cool. While we're here, open `base.html.twig` and link to this. Search for "Skills".
There's the link. Set the `href` to `{{ path('app_skills') }}`.

I like it! Refresh, try the link in the header and... the page works!

## Adding Content Manually?

To put *content* onto this page, we could *also* do that manually by writing code
in our app! The Contentful library we installed earlier has a `ClientInterface`
service that we could use to fetch all of these skills from Contentful in our
controller.

But instead, let's take the easy way out and let *layouts* fetch the skills *for*
us. Oh, but before we do that, back in `skills.html.twig`, add a
`block title`, write "All Skills" and then `endblock`.

This, as you probably know, controls the page's title. I'm doing this *here*
because the `title` block is actually *not* something you can control via Layouts.
Remember: everything we build in our layout becomes part of a *block* called
`layout`.

## Adding the Skill List Layout

Ok, hit "Publish" on the Homepage Layout... and then create a *new* layout. I'll
use my favorite "Layout 2" and call it "Skills List Layout".

You know the drill. Start by linking the header zone... and the
footer zone. Then, let's build another hero. Add a column, give it a `hero-wrapper`
class, then put a "Title" block inside with "All Skills". To be even cooler, add
a text block below with some intro content.

Nice start! Publish the layout... so we can go link it to the `/skills` page.
Hit "Add New Mapping" and link this to the "Skills List Layout". Then go to
Details. This time I'll map via the Path Info, set to `/skills`. Hit save
changes.

Let's go see how our first attempt looks. And... not bad!

## Adding the Skills Grid

*Now* let's add the *important* stuff. Head back to the layouts admin and edit
this layout.

Below the column, add a new Grid. Change this from a manual collection to a dynamic
collection. The Contentful package gives us *two* new "query types", or ways to
"fetch" data from Contentful. Use "Contentful Search". That's the main one.

This allows you to choose *which* content types to show, like all of them... or
just skills. We can then sort them, add a search, skip items or limit them. It's
*everything* we want, out-of-the-box!

What does it look like? Hit Publish. I bet you can guess. Yup! It "works"... by
printing out the title of each skill. Oh, let me at least add that "container"
class... to get the left and right margin.

But, this is *obviously* not what we want! We need to be able to *style* this
and print out more fields than just the title. We have the same problem on
the homepage.

And actually, this is even *more* complex than it seems! When we customize how a
grid of skills renders, I want to be able to make those items look *one* way on
the homepage, and a *different* way on the "Skills" page, probably larger and with
more fields printed.

Next: let's start learning the very important topic of how we can override and
customize the templates from Layouts so that we can make things look exactly like
we want.
