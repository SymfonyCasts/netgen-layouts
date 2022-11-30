# Contentful

If we add five more entities that we want to be able to select as items on our site, we could add five more value types, query types, and item views. Now that we know what we're doing, it's a pretty quick process to make adjustments and it gives us a lot of power on our site. But one of the beautiful things about Layouts is that our value types can come from *anywhere* - a Doctrine Entity, data on an external API, data in a Sylius store or an ibexa CMS. In fact, systems like Sylius and ibexa *already* have packages that do all of the work of integrating and adding the value types *for* you.

One of the biggest missing pieces on our site right now are these skills. The skills on the homepage are hard-coded and the "All Skills" link doesn't go anywhere. We *could* have chosen to store these skills locally via another Doctrine Entity, but *instead*, we're going to load them from an external API via a service called "Contentful".

I'll head over to contentful.com, log in, and that will take me to a "Contentful space" called "Bark & Bake" that I've already created. Contentful is *awesome*! It's basically a CMS as a service. We can create different types of content called "content models". Right now, I have a content type called "Skill" and another one called "Advertisement". If we click on these, we can actually fill in content.

Here are five skills that I've already created, each with a bunch of data on them. Contentful then has a restful API we can use to fetch all of this info. Contentful is *cool*, but the point of this isn't to teach you about Contentful. Nope! It's to show you how we could grab content for Layouts from *anywhere*. To grab that content, we *could* manually create a new value type for skill and do all the work that we did before. But layouts *already* has a bundle that supports Contentful, which does all of the value type, query type, and item view stuff *for* us. So let's grab it!

Spin over your terminal run:

```terminal
composer require netgen/layouts-contentful -W
```

The `-W` is just there because if you try to run this without it, you'll get an error. It's there to allow a downgrading package that's not *super* important. Adding `-W` likely *won't* be necessary in the future. The recipe for this package added a new config file - `/config/packages/contentful.yaml` - which reads two new environment variables, which live in `.env`.

While we're here, let's point this at my Contentful space, because that's where we're going to grab the content. Copy the keys from the code block on this page and paste them here. Here's my `CONTENTFUL_SPACE_ID`... and here's my `CONTENTFUL_ACCESS_TOKEN`, which will give us read access to that space.

Okay, the Layouts in Contentful integration give us two very separate things, and it's *super important* to understand the difference. The first thing the package adds is integration between Layouts and Contentful. This means that it adds new value types, new query types, and all the other stuff we just added by Doctrine.

The second thing Contentful integration adds that's *completely unrelated* to Layouts is dynamic routes, which make every item in our system available via its own URL. So, quite literally, *all() of these skills will instantly have their own page on our site.

To get that second part working, where every piece of content on Contentful becomes a page on our site, we need to go into the `/config/packages` directory, add a new file called `cmf_routing.yaml`. CMF Routing is a package that Contentful uses behind the scenes to add those dynamic routes. I'll paste some contents in here. It's not very pretty, but this part doesn't really have anything to do with Layouts, so that doesn't matter too much. This is *all about* allowing Contentful to automatically add dynamic URLs to our site.

Okay, this routing system stores routes in the database, and that means we need some new database tables to add those. Head over to your console and run:

```terminal
symphony console make:migration
```

And... I get an error. *Rude*. Let's try clearing our cache. Maybe something weird happened, or it didn't see my new config file yet. Once the cache clears... I'll make the migration again, and... perfect! This time, it worked! Yep! It was just a cache problem. Let's open the `/migrations` directory to check that out, and... looks good! You can see it's got some database tables for the content, and some Contentful stuff. It's going to be adding dynamic routes. So *now*, let's run:

```terminal
symphony console doctrine:migrations:migrate
```

And... woohoo! We have the new tables we need.

*Finally*, we can run a command to load all of the content from Contentful and create those dynamic routes. Once again, this is functionality that has *nothing* to do with Layouts. To do that, run:

```terminal
symfony console contentful:sync
```

And... beautiful! We see that it loaded six items. On production, you can set up a webhook on Contentful that points to your site, so your site is *instantly* synced with any changes that you make on Contentful. But while we're *developing*, running this command will work just fine.

The result of this command is that every piece of content on Contentful now has its own page. To see them, run:

```terminal
symphony console contentful:routes
```

And... *awesome*! Apparently I have a URL called `/mashing`. Let's go check it out! Go back to our site, navigate to `/mashing` and... it works! *Sort of*. It's *here*, but the middle of it is empty.

Let's talk about what's going on next and how we can leverage Layouts to bring this page to life.
