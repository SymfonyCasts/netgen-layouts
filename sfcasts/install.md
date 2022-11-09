# Hello Layouts+ Setup!

Hey friends! I'm *so* glad you're here with me, because this tutorial is about
something fun, cool, and *quite* powerful. No, it's not about a masked, crime-fighting
feline with superpowers, though that *would* be pretty cool. This tutorial is all
about the Netgen Layouts package.

## What Is Layouts?

This library has existed for *years*, but I've only recently checked it out. Layouts
is, very simply, a way to take any existing Symfony app and add the ability to
dynamically rearrange how your pages and the content *on* those pages is organized
*on the fly* via an admin section. It's a really cool mixture of a normal Symfony
app with controllers and twig templates... plus content management features that
you can opt into on a page-by-page basis. I *particularly* love the opt-in approach

## Who Needs Layouts?

So why would you go to the trouble of using Layouts in your Symfony app? Well, not
*all* projects need this, but if an admin user needs to be able to make changes
to how your site and its content is organized, this is for you. This includes things
like being able to add and remove collections of items, like featured products
right to the middle of a page... or moving some custom HTML from a Twig template
higher or lower on the page... *or* adding some completely custom new content right
to the middle of the page *or* creating temporary landing pages and allowing all
of this to be done by regular 'ol users. You can leverage Layouts for a single page
on your site, leaving everything else to be a normal Symfony app, or *every* page
on your site can use it. Like I said, you can *opt into* Layouts as you see fit.

## Project Setup

I could go on and on, but it's probably best to see the Layouts magic in action.
It's *super* fun to play with so you should definitely download the course code
from this page and code along with me. When you unzip that file, you'll find a
`start/` directory with the same code that you see here. Pop open this `README.md`
file for all those sweet setup details. I've *already* gone over to my terminal,
installed my node assets via `yan install` and ran `yarn watch` to build my
CSS and JS files. But that's all just to make our app and this tutorial more
realistic. Layouts doesn't require us to use Encore and it doesn't mess with our
CSS and JS at all.

Anyway, the last step in the `README` is to open another terminal tab and run

```terminal
symfony serve -d
```

to start a web server at `127.0.0.1:8000`. I'll cheat and click that. And...
hello new side project: it's Bark & Bake! Listen, dogs are pretty tired of our lazy
attempts at canine cuisine. Crunchy kibble? *No thanks*. So we've built this site
to inspire people to be the *best* chefs they can be... for their dogs.

This is a pretty traditional Symfony app with a couple of controllers and some Twig
templates. It also has two entities: A `User` entity for security, and a `Recipe`
entity. On the site, we have a homepage that shows the latest and greatest recipes,
a recipe section, and the ability to *open* a specific recipe so we can follow along
in the kitchen. That's *it*. This skills stuff isn't implemented at *all* yet.

So, other than being able to edit the details of each recipe via an admin area, this
is a static site! Time to change that! Soon, we'll be able to take this homepage -
which is written via a normal Symfony controller and template... as you can see
here - and use layouts to *dynamically* insert content (like a list of the latest
recipes or other content) right onto the page.

## Installing Layouts

That sounds fun to me! So let's get Layouts installed. Find your terminal and run:

```terminal
composer require netgen/layouts-standard
```

This will download several packages, including a couple of new bundles. When it
finishes, run

```terminal
git status
```

to see that it *also* added two new route files, which add some admin routes that
we're going to see in a few minutes.

## Running the Migrations

Layouts comes with some extra database tables that help store info about how our
layouts are organized and any custom content we're putting into them. We'll see all
of that in the Layouts admin section in a minute. To add the tables needed for this,
scroll up and copy this nifty `doctrine:migrations:migrate` line.

This is kind of cool. The layouts packages *comes* with migrations... and this
*executes* those migrations. Paste this command. but if you're using the Docker
database described in the README - I am - then modify this to start with
`symfony console` so that it can inject the Docker environment variables that point
to our database:

```terminal-silent
symfony console console doctrine:migrations:migrate --configuration=vendor/netgen/layouts-core/migrations/doctrine.yml
```


And... perfect! One caveat is that these migrations are written for MySQL
*specifically*. Layouts *only* supports MySQL right now.

## Ignoring the Custom Tables

For the most part, *Layouts* is going to handle all of the tables that were just
added by the migrations: we don't need to do anything with them. But now that
those exist in our database, if we were to add a new entity in the future and then
generate a migration for that... the migration will try to *drop* all of the Netgen
Layouts tables. Watch! Run:

```terminal
symfony console doctrine:schema:update --dump-sql --complete
```

This mimics generating a migration, and... yup! It wants to drops all of the Netgen
Layouts tables. To fix this, head into `config/packages/doctrine.yaml` and, under
`dbal`, add `schema_filter`, and pass a regular expression... which you can copy
from the Layouts documentation.

Perfect! With that, if we go back and run the `doctrine:schema:update` command
*again*...

```terminal-silent
symfony console doctrine:schema:update --dump-sql --complete
```

It's *clean*, except for `doctrine_migration_versions`. But, no worries: the
`make:migration` command is smart enough not to drop its *own* table.

Ok, Netgen Layouts is installed and it has the database tables it needs. If we go
back and refresh our site now... *congratulations*! Absolutely nothing is different.
Though, we *do* have a cute little web debug toolbar icon down here that we'll talk
about later.

This, again, is one of the great things about Layouts. Just installing it does *not*
take over your app. Layouts is not being used at *all* to render this page.

Next, let's dive into the Layouts admin area to create our first layout. Then, we'll
see how that interacts with the *real* pages on our site.
