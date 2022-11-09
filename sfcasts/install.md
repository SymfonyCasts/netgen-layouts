# Install

Hey friends! I'm *super* glad you're here with me, because this tutorial is about something fun, cool, and *quite* powerful. Nope, it's not about a masked, crime-fighting feline with superpowers, though that *would* be pretty cool. This tutorial is all about the Netgen Layouts package. This library has existed for *years*, but I've only recently checked it out. Layouts is, very simply, a way to take any existing Symfony app and add the ability to dynamically rearrange how your pages and the content *on* those pages is organized *on the fly* via an admin section. It's a really cool mixture of a normal Symfony app with controllers and twig templates, plus content management features that you can opt into on a page-by-page basis. I *particularly* love the opt-in approach.

So why would you go to the trouble of using Layouts in your Symphony app? Not *all* projects need this, but if your site requires regular changes to the page layouts via an admin section, this is for you. This includes things like being able to add and remove collections of items, such as featured products or popular blog posts that you show on different pages, *or* moving a list higher or lower on the page, *or* adding some random content right in the middle of the page, *or* creating temporary landing pages and allowing all of this to be done by regular 'ol users. You can leverage Layouts for a single page on your site, leaving everything else alone, or *every* page on your site can use it. Like I said, you can *opt into* Layouts as you see fit. It won't take over your app unless you design it that way.

I could go on and on, but it's probably best to just see Layouts in action. It's *super* fun to play with, so you should definitely download the course code from this page and code along with me. When you unzip that file, you'll find a start directory with the same code that you see here. Pop open this `README.md` file for all those sweet setup details. I've *already* gone over to my terminal and installed my node assets and ran

```terminal
yarn watch
```

to build my CSS and JS. That's just to make our app more realistic. Layouts doesn't require us to use Encore and it doesn't mess with our CSS and JS at all.

Anyway, the last step on the `README.md` file is to open another terminal tab and run

```terminal
symfony serve -d
```

to start a web server at `127.0.0.1:8000`. I'll cheat and click that... to say "hello" to our latest project: Bark & Bake! Listen, dogs are pretty tired of our lazy attempts at canine cuisine. Crunchy kibble? *No thanks*. So we've built this site to inspire people to be the *best* chefs they can be for their dogs.

This is a pretty traditional Symfony app with a couple of controllers and some twig templates. It also has two entities: A user entity for security, and a recipe entity. On the site, we have a homepage that shows the latest and greatest recipes, a recipe section, and the ability to *open* a specific recipe so we can follow along in the kitchen. That's *it*. This skills thing isn't even hooked up yet.

So, other than being able to edit the details of each recipe via an admin area, this is a static site. Time to change that! Soon, we'll be able to take this homepage, for example, which is written in a normal Symfony controller and template, as you can see here, and use layouts to *dynamically* insert content (like a list of the latest recipes or other content) right onto the page. Cool! So let's get Layouts installed.

Find your terminal and run:

```terminal
composer require netgen/layouts-standard
```

This is going to download several packages, including a couple of new bundles. If I run

```terminal
git status
```

you can see that it also added two new route files, which will enable some admin routes that we're going to see in a few minutes.

Layouts comes with some extra database tables that help store information about how our layouts are organized and any custom content we're putting into them. We'll see all of that in the Layouts admin section in a minute. To add the tables needed for this, scroll up and copy this nifty `doctrine:migrations:migrate` line. This is kind of cool. The library comes with migrations, so we can execute *their* set of migrations. I'll past that at the bottom, and if you're using the Docker database set, you'll want to change this to say `symfony console` so that it can inject the environment variables we have in that command. Perfect! One caveat is that these migrations are written for MySQL *specifically*. Layouts *only* supports MySQL right now.

For the most part, Layouts is going to handle the tables that were just added by the migrations automatically. But now that we have these extra tables in our database, if we were to add a new entity in the future and go to generate a migration for it in our application, that migration is going to try to drop all of the Netgen Layouts tables. Watch! Run:

```terminal
symfony console doctrine:schema:update --dump-sql
--complete
```

This mimics generating a migration, and you can see that it drops all of the Netgen Layouts tables. To fix this, head into `/config/packages/doctrine.yaml` and under `dbal`, say `schema_filter`, and we'll pass a regular expression here, which you can copy from their documentation. Perfect!

With that, if we go back and run the `doctrine:schema:update` command *again*... it's *clean*, minus `doctrine_migration_versions`. That's just because the `make:migration` command is smart enough not to drop its own table.

All right, we've got Netgen Layers installed and we have the database tables that it needs. If we go back and refresh our site now... *congratulations*! Absolutely nothing is different. Though, we *do* have a cute little web debug toolbar icon down here that we'll talk about later. This, again, is one of the great things about Layouts. Just installing it does *not* take over your app. Layouts is not being used at all to run to this page. We get to choose which pages are processed through it.

Next, let's dive into the Layouts admin area to create our first layout. Then, we'll see how that interacts with the *real* pages on our site.
