# Block Plugins

Well look at us! We've made it to the *last* topic of the tutorial. We've already
transformed our static site into one where we can reorder the layout for each
page, mix it with custom code from Twig templates and add dynamic content.
That's... kind of awesome. Of course, we haven't covered everything you can do with
Layouts, but you're now truly dangerous.

## Creating a Custom Block?

One topic that we *haven't* covered is how to create a totally *new* block, but
this *is* documented and, at this point, I think it wouldn't be too hard. Why
*would* you build a custom block? Suppose you have something super custom like
our "Hero" area or this "subscribe to newsletter" area, which is actually powered
by Symfony's UX Live Component package, which gives it the fancy Ajax behavior.

Anyways, if you want something like this on your page, the simplest way to add
it is... how *I* did in this project: put the logic in Symfony, render inside
a Twig block, then *include* that Twig block inside of Layouts.

But what if we want the admin user to be able to add this to *multiple* pages
whenever they want? *That* is when creating a custom block would be useful. Custom
blocks can also have options, so you could even let them customize this
in some way.

## Hello Block Plugins

Anyways, let's do one last challenge related to blocks: create a block plugin.
Go to a skill show page. Hmm, we could probably use a bit more margin between
these blocks. And that's a pretty common need. We *could* handle this by adding
a CSS class that sets the margin. But I want to make it even *easier*.

Go to the Layouts admin, then edit the Individual Skill Layout. Ok, suppose we want
to add some margin right here. To do that, I want the admin user to be able to
click on *any* block in the system - for example, this column block - and over on
the design tab, select the top or bottom margin they need from a new form field.

This is a pretty wild goal... because, to accomplish it, we need to be able to
*modify* *every* block in the system! Fortunately, *that* is exactly the point
of a block plugin: to *extend* one - or every - block.

## Creating the Block Plugin

Let's get to work. In the `src/Layouts/` directory, create a new PHP class called,
how about, `VerticalWhitespacePlugin`. This needs to implement a `PluginInterface`.
But in practice, we extend a `Plugin` class that implements that interface for us.
Go to "Code"->"Generate", or `Command`+`N` on a Mac, and implement the one method
we need: `getExtendedHandlers()`:

[[[ code('df7bdd362a') ]]]

Ok, each block in the system - so every item over here on the left menu - has
a *class* behind it called a block handler. Our job in `getExtendedHandlers()` is
to return an iterable of *all* the "handlers" that we want to extend. For example,
if you wanted to *only* extend the title block, you could
`yield TitleHandler::class`. How did I know to use that class? Well, most of
the time you can guess: the title block has a `TitleHandler`. But if you want
to look deeper, you can see *all* the handlers in the system by running:

```terminal
php bin/console debug:container --tag=netgen_layouts.block_definition_handler
```

Anyways, in our case, we want to override *every* block. So we can
`yield BlockHandlerDefinitionInterface::class`, because *every* block handler must
implement that interface:

[[[ code('c8023c3d3a') ]]]

And yes, I *totally* just forgot the word `Definition`. Whoops! I'll fix this
bad interface in a minute.

## Adding a Custom Block Parameter/Field

To see what to do next, go back to the "Code"->"Generate" menu, select
"Override methods" and choose `buildParameters()`. We don't need to call the parent
method because it's empty:

[[[ code('85ef1b82b1') ]]]

Parameter is the word that Layouts uses for the form *options* that you can customize
on the right side of the screen for every block. Thanks to our `getExtendedHandlers()`
method, when Layouts builds those options for *any* block, it will now call
*this* method and we can add *new* parameters.

I'll paste in the first... and we also need a `use` statement for this
`ParameterType` namespace:

[[[ code('cb192ec198') ]]]

Cool! As you can see, Layouts comes with a bunch of built-in "field types" - like
`BooleanField`, which will render as a checkbox. It defaults to false and has a label.
Oh, and this group? Remember how there are two tabs - "Design" and "Content"? This
is where you determine which your parameter should live inside.

And the first key - `vertical_whitespace:enabled` is  the internal name of this
field. You'll see how we use that in a minute.

Before we try this, future Ryan has just informed me that... I messed up! Typical.
Scroll up. I'm yielding the wrong class! Yield `BlockDefinitionHandlerInterface::class`:

[[[ code('23c1bca5e6') ]]]

That's better.

*Now* let's try it. Refresh... click on any block... let me find my Title
block... and... there it is! On *any* block we see the new field!

## Adding "Child" Parameters/Fields

But, the *real* idea is that, if the user enables this, we show them two *more*
fields where they can select the top or bottom margin.

To do that, after the first field, I'll paste in two more parameters:

[[[ code('96b06e749a') ]]]

These are basically like the first. The big difference is that, up here, we said
`$builder->add()`. But *now* we have `$builder->get('vertical_whitespace:enabled')`
and *then* `->add()`. This makes these *child* fields under the first.

This is pretty cool. Refresh and... let's find the Column block. Click to
"Enable Vertical Whitespace". Woh! The other two fields showed up! Let's do
"Medium" top spacing and "No" bottom spacing. Publish that.

## Using the Parameters in the Block Template

It shouldn't be *too* surprising, however, that when we refresh the page...
absolutely nothing happens! We added those options... but we're not *using* them
anywhere yet. We need to override a template to do that.

Let's think: we want this top and bottom margin to apply to *every* block in the
system. And, fortunately, every block in the system eventually extends
`block.html.twig`: this one here in the `nglayouts/themes/` directory.

Copy this. Then override it via the theming system. If we follow the path...
`standard/block`... `standard/block`... the new file should live here:
`block.html.twig`. Paste the contents inside.

To make sure this is working, put a little `TEST`:

[[[ code('af2d79735c') ]]]

Ok! Refresh the frontend. Yikes! Yep, that's definitely working. Go... take that out.

At the top of the template, we have a variable called `css_class`, which is set
to some core classes. And hey! It calls `block.parameter('css_class')`! Yup,
*that's* what reads the "CSS class" field from the block options!

Then, it uses `|join(' ')` to combine all of these into a string.

I'm going to *remove* that `join()`... then rename this variable to `css_classes`:

[[[ code('adbbdf8423') ]]]

We're setting things up so that we can easily *modify* that variable. Down here,
right before `block_content`, recreate that `css_class` variable set to
`css_classes|join(' ')`:

[[[ code('b1a5b01a60') ]]]

This variable is used in a bunch of different places *and* in child templates.
So we need to make sure it's still set.

Anyways, up here, we now have a `css_classes` array. Let's use that! I'll paste
in three variables, each set to the value of our three parameters:

[[[ code('ce7b33eadc') ]]]

This is where the parameter name we used in the class comes in handy.

Now, very simply, if `use_whitespace`, then add some margin classes. I'll paste
that code in too:

[[[ code('26c42409e5') ]]]

So, for the top margin, we're adding a new `whitespace-top-` followed by `none`,
`small`, `medium` or `large`. And same for the bottom.

These new classes are totally invented: they're not part of Bootstrap CSS or
anything else, but you *could* make this smarter to reuse those. But for us,
if you open `assets/styles/app.css`... near the top, here we go!

[[[ code('94ec7f3631') ]]]

Before the tutorial, I already prepared those classes.

So... it should work! Move over and refresh. Got it! Our block has a little extra
top whitespace... which comes from our new class.

And... done!, Woo! Great job team! You're now a Layouts champion! Let us know
what cool things you're building with it. And if you have any questions, as always,
we're here for you down in the comments section.

Alright, thank you and seeya next time.
