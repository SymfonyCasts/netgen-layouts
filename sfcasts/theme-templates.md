# Themes & Overriding Templates

We can now add *a lot* of dynamic content to our site, like these static blocks up
here, grids, or lists. The grids and lists can hold items from Contentful *or* our
`Recipe` entity. But to *really* make our site shine, we need flexibility over
*how* these pieces look. Let's start simple, by overriding the template that renders
what the "Title" block looks like for our *entire* app.

## Finding Block Templates in the Profiler

To do that... we *first* need to figure out *which* template is currently responsible
for rendering this block. An easy way to find out is to go to a page that renders
one of these, refresh, and click on the Twig icon on the web debug toolbar. Down
at the bottom, we see the whole tree. And if we look closely, ah ha! Apparently
there's a template called `block/title.html.twig`!

Layouts itself *also* has a really nice web debug toolbar section. If you go to
"Rendered blocks", it shows "Block definition: title", "Text", "List", and
"Footer". And, as we saw, the Title is rendered by `title.html.twig`.

## Hello Themes

Notice that almost all of these templates are nestled inside `themes/standard/`
directories. Layouts has a concept of *themes*, though we won't need to create
*multiple* themes unless we're building some sort of multi-site application. In our
case, we're just going to use the one *built-in* theme called `standard`.

But themes *are* still important, because anything *inside* of a theme can be easily
overridden by putting a template in *just* the right location. We're going to use
that convention to override the Title template.

## Overriding the Title Template

Let's do it! First, in the `templates/` directory, make sure you have an `nglayouts/`
subdirectory. Inside of that, add a new one called `themes/`... followed by a
*another* subdirectory called `standard/`. You may have noticed that we're matching
the structure that's over here: `nglayouts/themes/standard/`.

Inside of *this*, since the target template is named `block/title.html.twig`, if
we create that *same* path, *our* `title.html.twig` will win. Do it: add another
directory called `block/` and a new file inside: `title.html.twig`. To see if it
works, just write some dummy text:

[[[ code('a63c8ee8e8') ]]]

Let's try this thing! Go back to the Skills page, refresh, and... absolutely *nothing*
happens. That's because the first time we create this `themes/` directory, we need
to clear the cache.

```terminal-silent
php bin/console cache:clear
```

Do that... then with that behind us, try the page again. Woohoo! *We* now control
how the Title block renders! The power!

## Making the Title Template More Realistic

Okay, but even if we want to customize how the Title renders... we probably *don't*
want to start from scratch. It would be better to *reuse* part of the core template,
or at least use it as a reference.

Hit `Shift`+`Shift`, search for `title.html.twig`, and select "Include non-project
items". Open the core one from `nglayouts/themes/`.

Wow. There is *a lot* going on here... including the fact that this extends another
template: `block.html.twig`. Open that up.

This contains a *lot* of base functionality, like reading the dynamic `css_class`
variable, which contains any CSS classes we enter into the admin. It also handles
if there's a container or not. That's useful stuff!

In `title.html.twig`, it has code for whether or not the title is a link and other
stuff. We *could* totally replace this template and ignore all this if we wanted to.
But instead, copy the core template, paste it into our version:

[[[ code('7c0600c978') ]]]

And just to prove that we can, let's remove that `title` class:

[[[ code('3954decadb') ]]]

Cool! Now go over, refresh and... it goes back to how it looked before. But down
here, that `title` class on the `<h1>` is gone!

So the simplest way to control how something looks is to find the template that
renders it and override it completely using this `themes/` directory structure.

Let's use that trick *again* next to customize what it looks like when you render
an "asset" field from Contentful, like this skill image field. But along the way,
we're going to deep dive into a some massively important concepts: *block views*
and *view types*.
