# Prepending Config

I'm *pretty* sure that our new `item_view` is configured correctly. We have
`item\value_type: contentful_entry`, which I *know* is correct... and then we're
using `contentful\content_type` set to `skill` so that this *only* affects skills.

But... it doesn't seem to be working on the frontend. Earlier, when we ran
`debug:config`, we saw that the *problem* lies with the *order* of the config. Layouts
reads from top to bottom when deciding which "view" to use. So it looks at this one
first, sees that the `value_type` *is* `contentful_entry`... and just stops. To fix
this, we need to *reverse* our config.

Ok, so... why is it in this order to begin with? Why does our config show up at
the bottom? This is due to how Symfony loads config: it loads *bundle* config
*first* - like from the Contentful package or Layouts - and *then* loads *our*
configuration files. And, that's *usually* the order we want! It allows us to
*override* configuration that's set in bundles.

But in *this* case, we want the opposite. How do we accomplish that? By asking Symfony
to *prepend* our configuration.

## Setting up the Prepend

In the `config/` directory, create a new directory called `prepends/`
and move the Netgen Layouts configuration into it. This will stop Symfony from
loading that file in the normal way: we're going to load it manually.

The next step is a bit technical. In `src/`, create an "extension" class called,
how about, `AppExtension`. I'm going to paste in the code: you can grab this from
the code block on this page. This loads our config file like normal... except
that it will be *prepended*.

Final step. To get this method to be called, open up the `Kernel` class. After
`use MicroKernelTrait`, add `configureContainer as baseConfigureContainer`.

This adds the `configureContainer` method from `MicroKernelTrait` *into* this class
like a trait normally would... except that it *renames* it to
`baseConfigureContainer`. We're doing this so that we can define our *own*
`configureContainer()` method. Copy the `configureContainer()` signature from the
trait, paste, hit "OK" to add the `use` statements and then call
`$this->baseConfigureContainer()` passing `$container`, `$loader`, and `$builder`.

The `configureContainer()` method in the trait is responsible for loading
`services.yaml` as well as all of files inside `config/packages/`. That's
all good stuff that we want to *keep* doing. But after doing that, add one more
thing: `$builder->registerExtension(new AppExtension())`.

Again, yes, this is annoyingly technical. But thanks to these two pieces, our
`netgen_layouts.yaml` config will be *prepended*.

Check it out! Re-run the `debug:config` command again

```terminal-silent
php bin/console debug:config netgen_layouts view.item_view
```

scroll up and... yes! Our configuration is *now* on top! And when we refresh...
woohoo! We see the text!

Next: let's make this template render *exactly* like the hardcoded skills. Then
we'll create a *second* item template to customize how the Contentful
"Advertisement" content type renders.
