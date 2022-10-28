# Install

Coming soon...

Hey friends, I'm super glad you're here with me because this tutorial is about
something just kind of fun, cool, and quite powerful. It's about neck Ends layouts
package, a library that's existed for years, but I've only recently checked it out.
Layouts is very simply a way to take any existing symphony app and add the ability to
dynamically rearrange how your pages are organized and even the content on those
pages on the fly via an admin section. It's a really cool mixture of a normal
symphony app with controllers and twig templates, plus content management features
that you can opt into on a page by page basis in. I particularly love that opt-in
approach. Now, why would you go to the trouble of using layouts in your Symphony app?
Well, for sure, not all projects need this, but if your site requires regular changes
to the page layouts via an admin section, this is for you. That includes being able
to add and remove collections of items like featured products or popular blog posts
that you show on different pages, or moving that list higher or lower on that page,
or adding some random content right in the middle of the page, or creating temporary
landing pages and allowing all of this to be done by non-tech users.

And you can leverage layouts for a single page on your site, leaving everything else
alone or every page on your site can use it. Again, you opt into layouts. It doesn't
take over your app. Anyways, to say more, we just need to see layouts in action.
Layouts is super fun to play with, so you should definitely download the course code
from this page and code along with me. When you on zip that file, you'll find a start
directory with the same code that you see here. Pop up on this read me MD file for
all the setup details. Now, I've already gone over here in my terminal and installed
my node assets and run it yarn watch to build my CSS and js. That's just to make our
app more realistic. Layouts doesn't require that we use Encore and it doesn't mess
with our CSS and JS at all. Anyways, the last step on that read file is going to be
open another terminal tab in running Symphony serve dash D to start a web server at 1
27 0 0 1 colon 8,000. I'll cheat and click that and say hello to our latest project.
Bark and Bake. Listen, dogs are getting kind of sick and tired of our lazy cooking
skills when it comes to cooking meals for them.

So we've built this site to inspire people to be the best chefs they can be for their
dogs. This is a pretty traditional symphony app with a couple of controllers and some
twig templates. It also has two entities, one user entity for security and a recipe
entity on the site. We have a homepage that shows the latest recipes, a recipes
section, and the ability to see a specific recipe. That's it. This skills thing isn't
even hooked up yet. So other than being able to edit the details of each recipe via
an admin area, this is a static site time to change that. Soon we'll be able to take
this homepage, for example, which is written in a normal symphony controller and
template, as you can see here. And we're gonna use layouts to dynamically insert
content onto this page, like a list of the latest recipes or just some content right
into the middle of the page. Cool. So let's get layout installed. Find your terminal
and run composer require net gun slash layout slash standard, and this is gonna
download several packages including a couple of new bundles.

It's also, I wanna get status and also added two new route files, which are going to
enable some admin routes that we're gonna see in a few minutes. Now, layouts comes
with some extra database tables that help store information about how our layouts are
organized and any custom content we're putting into them. All stuff that we are going
to see in a minute in the layouts admin section. To add the tables needed for this,
you can actually scroll up and copy this nifty doctrine migrations migrate line. So
this is kind of cool. The library comes with migrations, and so we can execute their
set of migrations. So at the bottom I will paste that, Oops, pace that, but if you're
using the Docker database set, we have run symphony console so that it can inject the
environment variables that we have in that command and perfect. Now, one caveat is
that these migrations are written for my S SQL specifically. So layouts only supports
my SQ right now. Now, the only issue with these tables that were just added by the by
the migrations, for the most part, layouts is just gonna handle those tables
automatically.

But now that we have those extra tables in our database, in the future, if we add a
new entity and go to generate a migration for in our application, that migration is
going to try to drop all the neck end layouts. Um, tables watch. I'll show you on
symphony console doctrine schema update dash dash dump dash sql dash dash complete.
This mimics what a migration would do if we ran it, if we generate migration. And you
can see it drops all of the neck end layouts tables. So to fix this, head into config
packages, Dr. Di Yael and under De Ball say schema filter. And then we can pass a
regular expression here, which you can actually copy from their documentation.
Perfect. And with that, if we go back and run that doc update command, again, it's
clean

Minus the doctrine migrations versions, but the make migration command is smart
enough not to drop its own table. All right, so we've got neck and layers installed.
We've got the database tables that it needs. So if you go back and refresh our site
now, couldn't congratulations. Absolutely nothing is different though. We do have a
cute little Web Depot toolbar icon down here that we'll talk about later. This again,
is one of the great things about layouts just installing. It does not take over. Your
app layouts is not being used at all to run to this page. We get to choose which
pages are processed through it. So next, let's dive into the layouts admin area to
create our first layout. Then we'll see how that interacts with the real pages on our
site.

