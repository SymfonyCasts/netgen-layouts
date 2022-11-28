# Contentful

Coming soon...

So if we add five more entities that we wanted to be able to select as items on our
site, we could add five more value types, query types, and item views. Really, now
that we know what we're doing, it's a pretty quick process in very quickly gives us a
lot of power on our site. But one of the beautiful things about layouts is that our
value types can come from anywhere. A doctrine entity, data on an external api, data
in a silliest store or an IXa cms. In fact, systems like Sillus and IXa already have
packages that do all of the work of integrating and adding the value types for you.
And if you think about it, creating a value type that loads from an external API
would be really no different than adding a value type from doctrine. Not sure that
needs to be said. One of the biggest missing piece in our site pieces on our site
right now are these skills. These skills on the homepage are hard coded and the
skills all skills linked doesn't go anywhere. We could have chosen to store these
skills locally via another doctrine entity, but instead we are going to load them
from an external API via a service called Contentful.

I'm gonna add a contentful.com log in, which is gonna take me to what's called a
Contentful space called a Bark and Bake that I've already created. Contentful is
awesome. It's basically a CMS as a service. We can create different types of content
called content models. Right now I have skills and another one called advertisements,
and then we can actually fill in content. So here are five skills that I've already
created in here, each with a bunch of data on them. Contentful then has a restful API
we can use to fetch all of this info. Now, Contentful is cool, but the point of this
isn't to teach you about Contentful. Nope. It's to show you how we could grab content
for layouts from anywhere and to grab that content. We could manually create a new
value type for skill and do all the work that we did before. But layouts already has
a bundle that supports content fold and which does all of the value type query type
item view stuff for us. So let's grab it. Spin over your terminal run

```terminal
composer require netgen/layouts-contentful -W
```

 The dash W is just there because
if you try without you get an air, it's there so that it can down to allow a
downgrading one, not super important package

That probably won't be necessary in the in the future. Now the the recipe for this
package add a, a new config file, config packages content fold I amel, which reads
two new environment variables and those two new environment variables live here in
dot NV While we're here. Let's point this at my content full space. That's where
we're gonna grab the content from. So you can copy these keys from the code lock on
this page. Here's my space id, and here's a token that will give us read access to
that space. All right, so the layouts in content full integration give us two very
separate things, and it's super important to keep these things straight in your mind.
The first thing the package adds is integration between layouts and Contentful. So
that means that it adds new value types, new query types, all that kind of stuff that
we just added by doctrine. The second and completely unrelated thing it adds that's
totally unrelated to layouts is it adds dynamic routes to our system that make every
item on Contentful available via its own url. So quite literally, all of these skills
are instantly gonna have their own page and our site <affirmative>.

Now to keep those two things straight. So that second thing has, as I mentioned, has
nothing to do with layouts. It's almost like it's kind of adding, uh, CMS features to
our site that's poorly explained to get that second part working where every piece of
content on content fold becomes a page on our site. We need to go on the config
packages directory, add a new file called CMF Learner Score Routing yaml. CMF Routing
is a package that the content fold is using behind the scenes to add those dynamic
routes. I'm gonna pay some contents in here. This is super ugly. I don't like it. But
again, this, it really has, this part really has nothing to do with layouts. This is
all about allowing content fold to automatically add dynamic URLs to our site. All
right? This routing system stores routes in the database. So we need some new
database tables to add those. We can run symphony console, make migration, and I get
an air. That's an ugly error. Let's try clear our cash here. Maybe something weird
happened, maybe it didn't see my new config file yet, was the clash clears. Let's
make the migration again. Perfect. That's time it worked. Yep, just a cash problem.
Let's open the migrations directory. Check that out and perfect. So you can see it's
got some database tables for the content. Full inch content, full stuff. These are
the dynamic routes that it's gonna be adding.

So now let's run symphony console doctrine. Migrations migrate, and we have the new
tables we need. Finally, we can run a command to load all the content from content
full and create those dynamic routes. Again, this is still functionality that has
nothing to do with the layouts. This command at Symphony Console content full sync
and beautiful. It says it loaded six items on production. You can set up a web hook
on Contentful that points to your site

So that your site is instantly synced with any changes that you make on Contentful.
But while we're developing, running, this command will work just fine. The result of
this command is that all of our skill is that every piece of content at Contentful
now has a page to see it run Symphony console content, full routes, and awesome.
Yeah. Here we go. So apparently I have a URL called slash mashing. Now, let's go
check it out for the front of our site. Go to slash mashing, and it works. Sort of,
it's here, but the middle of it is empty. Let's talk about what's going on next and
how we can leverage layouts to bring this page to life.

