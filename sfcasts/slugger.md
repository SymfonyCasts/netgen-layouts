# Customizing the Contentful Slugger

Before we go further into customizing the look and feel of our site, I want to fix
the skill URLs so that instead of just `/mashing`, the page is `/skills/mashing`.
Remember: the fact that our Contentful content instantly has URLs on our site
comes from the Contentful package we installed earlier. But that magic has
*nothing* to do with Layouts. So, customizing this URL is *also* specific
to Contentful, not Layouts. But... I really want to fix it.

## Creating the Slugger Class

Over in the `src/Layouts/` directory, create a new class called `ContentfulSlugger`.
Make this implement `EntrySluggerInterface`... and then generate the one method
we need: `getSlug()`:

[[[ code('d59c8a45d0') ]]]

We're going to set things up so that this method is called when the dynamic URLs
for *all* Contentful entries are being created. It will allow *us* to control the
"slug", which is really the URL for each item.

To make life easier, use `FilterSlugTrait` to get access to a method we'll use in
a minute:

[[[ code('c95eae1b9f') ]]]

Ok, on Contentful, we have both Skills and Advertisements. But we don't really want
advertisements to have their own page. Unfortunately, with the Contentful integration,
there's no way to *disable* URLs for one specific content type. I'll talk about
how to work around that in a minute.

Anyways, this method will be passed both skills *and* advertisements. Use the new
PHP `match()` function to match `$contentfulEntry->getContentType()->getId()`.
That will return the internal name for each type, which you can find in Contentful.
If it's `skill`, return `/skills/` then `$this->filtersSlug()` - that comes from
the trait - passing `$contentfulEntry->get('title')`:

[[[ code('38236b5cbb') ]]]

For `advertisement`, return `/_ad` for all of them:

[[[ code('396457a084') ]]]

At least, at *this* point, only *one* ad could ever have a page on our site:
if the user went to `/_ad`, it would match the first one.

At the bottom, throw a new Exception with "Invalid Type":

[[[ code('23cf8d8b24') ]]]

So, yes, at this point, advertisements *will* still have their own page. There's
no way to turn that off out-of-the-box. But if you care enough, I would map all
advertisements to the same URL or URL pattern like this. Then I would create a
route & controller with the *same* URL and return a 404. That route will take
precedence over the dynamic one.

## Tagging & Configuring the Slugger

To tell Contentful to use our slugger, we need to, of course, give it tag! Add
`#[AutoconfigureTag]` and this one is called `netgen_layouts.contentful.entry_slugger`.
This also needs a `type` option... which you can set to *any* string. Let's use
`default_slugger`:

[[[ code('22d6c08c21') ]]]

How is that used? In `config/packages/`, we need to create a new config file for
the layouts contentful package. Let's call it `netgen_layouts_contentful.yaml`.

Repeat that for the root key. Below, add `entry_slug_type`, then `default` set
to the type we used in our tag: `default_slugger`:

[[[ code('78454fef7a') ]]]

This funny syntax says:

> For *every* content type in Contentful, use `default_slugger` when generating
> the URL. So, use our `ContentfulSlugger`.

Ok, done! But... this is *not* called when we reload the page. Nope. This is called
when we "sync" our content from Contentful. Ok, let's re-sync! At your terminal,
run:

```terminal
symfony console contentful:sync
```

This updates our local database with the latest data from Contentful... and it
worked just fine. But when we run:

```terminal
symfony console contentful:routes
```

The URLs didn't change! This is a quirk... or maybe a feature so that existing
pages don't break. Either way, once a route is imported the first time, it's URL
never changes.

The easiest way to reset things is to drop the routes table and reimport everything.

And, this is kind of fun. We can run:

```terminal
symfony console doctrine:migrations:migrate current-1
```

That will *reverse* the most recent migration, causing the contentful and route
tables to be *dropped*. Put them back with:

```terminal
symfony console doctrine:migrations:migrate
```

Re-sync the content again:

```terminal-silent
symfony console contentful:sync
```

And *now* check the routes:

```terminal-silent
symfony console contentful:routes
```

Yes! The URL is `/skills/mashing`! So, over on `/mashing`, we get a good-old
fashioned 404. But `/skills/mashing` works.

Next: we don't yet have a page that lists *all* of the skills. Let's fix that!
