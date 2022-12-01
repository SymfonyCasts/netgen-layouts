# Contentful: Loading Data from an External CMS

If we added five more entities and we wanted to be able to select those as items
in the layouts admin, we could add five more value types, query types, and item views.
Now that we know what we're doing, it's a pretty quick process and would give us a
*lot* of power on our site.

But one of the beautiful things about Layouts is that our value types can come from
*anywhere*: a Doctrine Entity, data on an external API, data in a Sylius store or
from Ibexa CMS. In fact, systems like Sylius and Ibexa *already* have packages that
do all of the work of integrating and adding the value types *for* you.

One of the biggest missing pieces on *our* site is the skills. The skills
on the homepage are hard-coded and the "All Skills" link doesn't even go anywhere!
We *could* have chosen to store these skills locally via another Doctrine Entity.
But *instead*, we're going to load them from an external API via a service called
"Contentful".

## Hello Contentful!

I'll head over to Contentful.com and log in. This takes me to a "Contentful space"
called "Bark & Bake" that I've already created. Contentful is *awesome*! It's
basically a CMS as a service. It allows us to create different *types* of content
called "content models". Right now, I have a content model called "Skill" and another
one called "Advertisement". If we clicked on these, we could *enter* content via a
super-friendly interface. I've already created 5 skills, each with a bunch of data.

So, you create and maintain your content *here*. *Then* Contentful has a restful
API that we can use to *fetch* all of this.

Contentful is *cool*. But the point of this isn't to teach you about Contentful.
Nope! It's to show you how we could grab content for Layouts from *anywhere*. For
example, if we want to load "skills" from Contentful, we could manually create a
new value type and do all the work that we did before, except making API requests
to Contentful instead of querying the database.

But! We don't even need to do that! Why? Because Layouts *already* has a bundle
that supports Contentful. That bundle add the value type, some query types, the
item views and even the content browser integration *for* us. Woh.

Let's grab it!

## Installing the Contentful Bundle

Spin over to your terminal and run:

```terminal
composer require netgen/layouts-contentful -W
```

The `-W` is there just because, at least when recording this, Composer needs to be
able to downgrade one small package to make all the dependencies happy. That flag
allows it to do that.

Ok! The recipe for this package added a new config file:
`config/packages/contentful.yaml`. And *this* reads two new environment variables...
which live in `.env`.

While we're here, let's update these values to point at *my* Contentful space.
Copy the keys from the code block on this page and paste them here. Here's my
`CONTENTFUL_SPACE_ID`... and my `CONTENTFUL_ACCESS_TOKEN`, which will give us
read access to my space.

## Contentful + Layouts

Okay, the Layouts + Contentful integration give us two *very* separate things, and
it's *super* important to understand the difference to keep everything clear.

First, the package adds an integration between Layouts and Contentful. This means
it adds new value types, new query types, and all the other stuff we just added
for Doctrine. In other words, we can *instantly* add the skills or advertisements
from Contentful into list or grid blocks. That is *great*, and we'll see it soon.

The *second* thing the Contentful integration adds is *completely unrelated* to
Layouts. It's dynamic routes. It adds a system so that every "item" in Contentful
is available via its own URL. Literally, *all* of these skills will instantly have
their own page on our site. This has *nothing* to do with Layouts, which is all
about controlling the layout for *existing* pages on your site, not adding new
pages.

## Setting up the Dynamic Routing

But, since Contentful is a CMS, it *is* nice to have a page for each piece of
content. To get the dynamic routes working, go into the `config/packages/` directory
and add a new file called `cmf_routing.yaml`. CMF Routing is a package that Contentful
uses behind the scenes to add the dynamic routes. I'll paste some config here.
It's ugly... but this part doesn't have anything to do with Layouts, so it
doesn't matter too much. This is *all about* allowing Contentful to automatically
add dynamic URLs to our site.

This routing system stores routes in the database... and that means we need some
new database. Head over to your console and run:

```terminal
symfony console make:migration
```

And... I get an error. *Rude*. Let's try clearing our cache... maybe something weird
happened... or it didn't see my new config file yet.

```terminal-silent
php bin/console cache:clear
```

Once the cache clears... I'll make the migration again. This time... perfect!
Open the `migrations/` directory, find that file and... it looks good! We have
a few tables that hold info about our Contentful data... and a few to store
those dynamic routes.

*Now* run:

```terminal
symfony console doctrine:migrations:migrate
```

And... woohoo! We have the new tables we need.

*Finally*, we can run a command to *load* all of our content from Contentful and
create those dynamic routes. Once again, this is functionality that has *nothing*
to do with Layouts. Run:

```terminal
symfony console contentful:sync
```

And... beautiful! It loaded six items. On production you can set up a webhook so
your site is *instantly* synced with any changes that you make on Contentful. But
while we're *developing*, running this command works fine.

The result of this command is that every piece of content on Contentful now has its
own page! To see them, run:

```terminal
symfony console contentful:routes
```

And... *awesome*! Apparently I have a URL called `/mashing`. Let's go check it out!
Go back to our site, navigate to `/mashing` and... it works! *Sort of*. It's *here*,
but the middle of it is empty.

Let's talk about what's going on next and how we can leverage Layouts to bring this
page to life.
