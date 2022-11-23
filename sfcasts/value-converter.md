# Value Converter

As soon as we changed our Grid type to use a Dynamic collection... it stopped loading.
The error is hiding down here in this AJAX call. The best way to see it is to
open that URL in a new tab. There we go:

> Value converter for `App\Entity\Recipe` type does not exist.

Okay, so far, we've created a custom "value type" for `Recipe`, which was just this
config, and a custom "query type" which allows us to load a list of the latest
recipes by running the query inside of the associated class. *Now* we're getting
this value converter error.

## Creating the Value Converter Class

A value converter is really simple: it's a class that transforms the underlying
object - `Recipe` - into a format that Layouts can understand. In that same
`src/Layouts/` directory, let's create a `RecipeValueConverter` class... and make
it implement `ValueConverterInterface`:

[[[ code('628e5b6967') ]]]

You know the drill: go to "Code" -> "Generate" (or `Command`+`N` on a Mac) and
hit "Implement methods" to generate the *seven* we need:

[[[ code('8d37f86a52') ]]]

I know, that sounds like a lot, but these are super easy to fill in.

First, for `supports()`, Layouts will call this method *every* time it has a "value"
it doesn't understand. We want to tell it that *we* know how to convert the `$object`
if it's an `instanceof` `Recipe`:

[[[ code('d12cff09a3') ]]]

Second, for `getValueType()`, `return` the internal *key* of our value type:
`doctrine_recipe`:

[[[ code('834efdca23') ]]]

Next is `getId()`... and we're literally going to `return` our ID with
`$object->getId()`:

[[[ code('352adab894') ]]]

We don't have autocomplete on this, but *we* know this object will be a `Recipe`.

For `getRemoteId()`, just `return $this->getId($object)`:

[[[ code('0f4ddd89e7') ]]]

This method is only important if you plan to use the import feature in Layouts
to move data, for example, between staging and production. If *were* planning
to do that, you could give your objects a UUID and return that here.

Down here, for `getName()`, this will be a human-readable name shown in the admin
area. This time, to help my editor, let's `assert()` that `$object instanceof Recipe`:

[[[ code('24634bca85') ]]]

Two things about this. First, *we* know that this object will always be a `Recipe`
because, up in `supports()`, we *said* that's that only object we support. Second,
if you haven't seen the `assert()` function before, if the `$object` is *not* an
`instanceof` `Recipe`, it will throw an exception. It's a really easy way to tell
your editor - or other tools like PHPStan - that the object is *definitely* an
instance of `Recipe`.... which means *now* we get autocompletion when we say
`return $object->getName()`:

[[[ code('cc0bbe6423') ]]]

Next is `getIsVisible()`. Just `return true`:

[[[ code('7eae615203') ]]]

If your recipes could be published or unpublished, for example, then you could
check *that* here to return `true` or `false`.

Finally, for `getObject()`, `return $object`:

[[[ code('03f4c13386') ]]]

I know, that seems a bit silly, but this is a handy way for you to *change*
your `Recipe` after it's loaded if you needed to. But that's not something
that we *need* to do.

And... done!

This time, unlike with the query type handler, autoconfiguration takes care of
*everything*... so we don't need to add a manual tag up here. Watch: move over
and try refreshing the AJAX endpoint first. *That* works! Now go over, refresh
the layouts admin page... and *whoa*. Check it out! We see a bunch of items
on our Grid! If we click that, we see the items loading below. That's awesome!

## Customizing the Item Results

Notice that we *only* had to choose "dynamic collection". We... never told the
system that we wanted to use the "latest recipes" query type. That's simply because
we only have *one* query type... and so Layouts guessed that's what we wanted. If
we added a *second* query type to the system, we would see another select drop-down
here where we could choose between latest recipes and "most popular" recipes,
for example.

So this is using our "latest recipes" query type to get 25 results. If we were
trying to recreate this area here, we would only want 4. So let's limit the
number of items to four. Cool!

## Checking out the Frontend

What does this look like on the frontend? Let's find out! Hit "publish and
continue editing" and.... once that saves, go over and refresh. It should show up
right here but... we see absolutely nothing! Or... it *seems* that way at first.

But when we inspect element... and zoom in a bit... there's a `div` with the class
`ngl-vt-grid` on it. And inside, a row and inside of *that*, a bunch of empty divs.
If you ignore the `clearfix` elements, this renders 1, 2, 3, 4 divs for our *four*
items! So the items *are* rendering... they're just rendering empty.

And, that makes sense. We haven't told layouts *how* recipe items should be rendered
yet. More on that in a few minutes.

## Query Type Form Options (Parameters)

But before we get there, I want to make our query type a *tiny* bit fancier. On
the first pass, we ignored the `buildParameters()` method. Whelp, it turns out
that this is a way for us to add extra *form fields* so an admin user can pass
*options* to the query.

For example, let's add an optional search term. Say `$builder->add()` passing
`term` - that will be the internal name for this new parameter - then `TextType`:
the one from `Netgen\Layouts`:

[[[ code('c78fcf3109') ]]]

There are a *bunch* of other field types for URLs, dates and more.

With *just* this, when we refresh the admin section... and click down on the grid,
there it is! We've got a big new box! Of course, if we *type* anything inside,
nothing happens... and it also has a weird label.

## Translating the Field Label

Let's fix that label first. Layouts defaults to this odd string, but it's already
running this through the *translator* via a domain called `nglayouts`. So, in the
`translations/` directory, create a file called `nglayouts.en.yaml`, or use
whatever format you want.

Paste the label and set it to "Search term":

[[[ code('730d026ff0') ]]]

Try the admin section now. When we click... much better! If you still see
the old label, try clearing your cache:

```terminal-silent
symfony console cache:clear
```

Sometimes Symfony doesn't notice when you add a *new* translation file.

## Using the Parameter

Ok, to *use* the search term, head over to our query type handler. The `Query`
object passed to `getValues()` contains any parameters we added. *And*, I
already prepared the `createQueryBuilderOrderedByNewest()` method to accept an
optional search term! Pass this `$query->getParameter()`, its name - `term` - then
`->getValue()`:

[[[ code('5a3bdca627') ]]]

Copy that and repeat it down here for the `getCount()` method:

[[[ code('3e10f8b2ef') ]]]

Alrighty, let's take this thing for a test drive! Refresh the Layouts area, go down
here and I think that worked! It shows no items... because I used a pretty silly
search term. Clear it out. We get everything. Now type just a few letters... and
watch as it changes below.

Next, let's teach layouts how to *render* recipe items both on the frontend as
well as for the admin-area preview.
