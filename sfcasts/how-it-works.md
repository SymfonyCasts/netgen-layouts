# Creating & Mapping Layouts

Ok, let's see what Layouts is all about. In this chapter, we'll, step-by-step,
create & use a "layout", learning *exactly* how Layouts works its magic along
the way.

To check out the Layouts admin section, head to `/nglayouts/admin` to find... a
login form! The login form has nothing to do with the Layouts... it's just that the
layouts admin area *requires* you to be logged in... and I've already added a login
form to our site. There's even a user in the database! Log in with
`doggo@barkbite.com`, password `woof`.

## The Security Role Needed for the Admin Area

And when we submit... access denied! No worries: click down on the web debug
toolbar's security icon... and go to "Access Decision". Yup: we were denied access
because it was looking for a role called `ROLE_NGLAYOUTS_ADMIN`. To access the
layouts admin area, we need to have this role.

The simplest way to add it is to go to `config/packages/security.yaml`. The user
we're logged in as right now has `ROLE_ADMIN`. So, under `role_hierarchy` *also*
give our user `ROLE_NGLAYOUTS_ADMIN`:

[[[ code('e46ba5fe4a') ]]]

## Creating our First Layout

And now if we click back, ta-da! Welcome to the layouts admin section! To
understand what layouts does... it's best to see it in action. Start in this Layouts
section... and click to create a new layout. This shows us about six different
layout *types* we can choose from. As you'll see, these are much less important
than they might seem at first, because, once you're in a layout, you can really
do whatever you want, including floating things left and right. I typically choose
"Layout 2". Call this "Homepage Layout" because I'm planning to use this on our
homepage.

And... welcome to the layout editor! Quick tour: these items on the left side
are called "blocks", and there are many different types, from simple title blocks
to Google maps... to more complex things like lists and grids where you can
render dynamic collections of things, like featured recipes. The main things we
"do" on this page is choose a block on the left... then drag it onto one of the
"zones" in the middle.

## Putting Blocks onto the Layout

Grab a "Title" block and drag it somewhere onto the page... then give it some
text. Cool!

It's a modest start, but, good enough! In the upper right, hit "Publish Layout".

And now that we have this new layout, open a second tab and go to the homepage
to discover that... absolutely nothing changed! Let me actually rearrange my tabs.

## Mapping a Layout

Anyways, nothing changed because, once you have a layout, you need to *map* it to
a specific page or set of pages. *That's* the job of the layout mapping section.
These are really the only two important sections in the admin area.

Here, add a new mapping and then go to Details. There are multiple ways that you
can map a layout to a specific URL. You could use, for example, the path info,
which is a fancy term that means "the URL, but without query parameters". Or you
could use a path info prefix - like use this layout for all URLs that start with
"/products". *Or* you can even map a layout to a specific route name.

Let's try that one. Hit "Add target". Then... let's go find our homepage route name:
`src/Controller/MainController.php`. Here it is: `app_homepage`:

[[[ code('d1393347fe') ]]]

Move back over, paste and hit "Save target".

We're going to talk about other ways to map or "activate" a layout for pages later.
But route and path info are the simplest and flexible. They say:

> If the current route or URL matches what we have here, use this layout.

Hit save changes. To choose *which* layout goes with this mapping, hit "Link
layout" and select the only one: "Homepage Layout".

Awesome! So *now* when we go to the homepage, it *should* use the homepage layout.
But... what does that even *mean*? Let's find out! Refresh and... we *still* don't
see any difference! It's the same static page from Symfony!

## Extending the Dynamic Base Layout

Oh, that's because we missed an important installation step. My bad! Go open the
template for this page: `templates/main/homepage.html.twig`. Right now, we're
extending `base.html.twig`:

[[[ code('69c71706f3') ]]]

And *that* template, like usual, has a block called `body` in the middle:

[[[ code('7b98ab918d') ]]]

So it's a *super* traditional setup.

Now, change the `extends` to a dynamic variable called `nglayouts.layoutTemplate`:

[[[ code('081e4be324') ]]]

## Configuring the Base Layout

Try the page again. Error! That's progress! It says:

> Base page layout, not specified. To render the page with Layouts, specify
> the base page layout with this config.

This will all make more sense in a minute. What it wants us to do is open
`config/packages/` and create a new file - which can be called anything - but let's
call it `netgen_layouts.yaml`. Inside, add `netgen_layouts` and, below that,
`pagelayout` set to our `base.html.twig`:

[[[ code('27cfddc67a') ]]]

I'll explain this all in a minute. If we refresh now... huh, same error! It's
possible Symfony didn't see my new config file... so let me clear the cache to
be sure:

```terminal-silent
php ./bin/console cache:clear
```

And now... yes! It works! Except... it's *still* the same static page!
*But*, for the first time, down on the web debug toolbar, it shows that the
"Homepage Layout" is being used. So it *realized* the layout should be used...
it just doesn't seem to be *rendering* it.

## Rendering the layout Block

To fix that, we need to do *one* last thing... then we'll back up and explain what's
going on and how cool it is. In `base.html.twig`, around `{% block body %}`,
add `{% block layout %}`... then after `{% endblock %}`:

[[[ code('8867c5b0b5') ]]]

Refresh one more time. And... whoa! Our page is gone! Okay, we still have the nav
and footer... which come from above and below the blocks in `base.html.twig`, but
the actual *contents* of our page are gone and replaced by the dynamic title block!
What Black Magic is this?

## The Layouts Template Inheritance Magic

First, before I explain, let me say that there are *much* faster ways to start with Netgen
Layouts: they have starter projects for normal Symfony apps, Sylius apps and Ibexa CMS
apps. But we did all this set up work *manually* on purpose... because I *really* want
you to understand *how* Layouts works: it's surprisingly simple.

First, our page is still hitting our normal route - `app_homepage` - and it's
*still* executing our normal controller and *still* rendering our normal template.
No magic there at *all*.

But then, we extend `nglayouts.layoutTemplate`. What does *that* point to? If there
is *no* layout mapped to a particular page, `nglayouts.layoutTemplate` will
resolve to `base.html.twig`. That's thanks to the config we added here:

[[[ code('e2c3c9b79f') ]]]

But if layouts *does* find a layout mapping for this page, then
`nglayouts.layoutTemplate` resolves to a core Layouts template. In this case,
if you hit `Shift`+`Shift`, it's called `layout2.html.twig`... since we selected
"Layout 2".

*This* renders the dynamic layout via these `nglayouts_render_zone` tags: each
of these refers to a different section - or "zone" - inside our layout.

*Anyways*, what's *really* important is that it renders the layout into a Twig
block called `layout`. It then extends `ngLayouts.pageLayoutTemplate`, which
resolves to *our* `base.html.twig`.

The end result is that our page renders *completely* normally and it still extends
`base.html.twig`... but a block called `layout` has been *added* that holds the
contents of the dynamic layout.

*That's* why we didn't see any changes on the page at first. Until we actually
*included* `{% block layout %}` in `base.html.twig`, the layout *was* loading...
we just weren't *rendering* it anywhere.

The takeaway is this: if you're on a page that does *not* map to a layout, everything
is *exactly* the same as always. But if you *are* on a page that maps to a layout,
it simply means that you now have a block called `layout` whose contents are equal
to whatever you have *inside* of that layout.

## Extending the Dynamic Layout on All Pages

So as I mentioned earlier, we don't have to add layouts to every page on our site:
we could add it to the homepage and be done! But every page that we want
to *support* layouts needs to extend `nglayouts.layoutTemplate`. The nice thing
is, even if we extend this, nothing *happens* unless we actually *map* a layout to
this page. So, there's no downside to using it everywhere. I'll quickly update
`login.html.twig` to use it:

[[[ code('2dd3fa018d') ]]]

then `list.html.twig` and `show.html.twig`:

[[[ code('0325f4f028') ]]]

[[[ code('959088390f') ]]]

I can really move fast when I need to!

Back in the browser, the recipe list and recipe show pages still look the same...
because no layout is resolved. But they're now *ready* to use layouts, if we want
to.

Now, as interesting as it is to dynamically control the content on the homepage,
we uh, kind of did too much! All of our old content is gone. Is it possible to mix
dynamic content with some of the static content from our homepage Twig template?
Absolutely. And that's a big part of what makes layouts special. That's next.
