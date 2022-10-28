# Theme Templates

Coming soon...

We can now add a lot of dynamic content to our site, like these static blocks up
here, or grids and lists. And those grids and lists can hold items from content full
or our recipe entity. But to really make our site shine and be ours, we need some
flexibility over how pieces on the site render. Let's start simple by overriding the
template that renders one of these blocks for the entire app. Let's over at the
template for the title block. So first, what template currently renders the title
block? Well, an easy way to find out is to go to a page that renders one of the title
blocks, refresh and go into the twig web debug, toolbar. Cause down at the bottom,
you can kind of see the whole tree here. And if you look closely, you can eventually
see down here. Here we go. Look it. Apparently there's a block title that html, that
twig. Cool. Also, layouts itself has a really nice web DBU to a bar section. And if
you go to render blocks, you can see block definition, title, text list, footer. And
in this case, the title is rendered by as we saw, title dot h channel dot twig. So
notice that this template and really almost all, all these templates live in a
directory

Called themes. And then standard. So layouts has a concept of themes. Though we won't
need to create multiple themes unless you were building some sort of multi-site
application. We are gonna just use the one built-in theme called standard. But themes
are still important because anything inside of a theme can be overridden really
easily. By putting a template in just the right spot, we're gonna use that convention
to override the title template. So here's how it goes. Since this lives in First in
the templates directory, make sure you have an NG layouts directory. And inside of
there a directory called themes, and then a sub directory called standard. So you can
see here we're kind of matching the structure that's over here, Angie Layouts themes
standard. Now inside of there, since this is called block slash title html twig, if
we create that same path in our directory, our title dot HTL twig will win. So in
other words, create a direct new directory called block and a new file on that called
title dot html dot twig. And just start. See if it works. We'll just write some dummy
text in there. All right, let's try it. Let's go back to our skills page refresh, and
absolutely nothing happens. First time we create that themes directory,

You need to clear your cash. Now that we've done that, woohoo, we are taking control
of the title. Okay, So maybe we wanna customize the title, but we don't wanna start
from scratch. We want to reuse some of the core logic. So let's actually open up.
I'll hit shift, Shift and go title that html, that twig and include non-project
items. Let's open the one from the core one, NNG layouts theme. So if there's
actually quite a lot going on here, notice it extends a template called Block dot
htm. That twig that's in this same directory, actually that's in one.

Oops.

We open block that HTML twig. Here we go. This contains a lot of base functionality
like reading the dynamic like CSS class, stuff that we may have set on it and
handling if there's a container or not on there. So this has some good stuff. And
then title, it also handles whether the title is a link and some other items. So we
can totally replace this if we want to. But instead, I'm going to copy the core
template, hasted into mine. And then just, I don't really need to change anything
here, but just to prove that I can, Let's remove that title Class's. Now, when we go
over and refresh, it goes back to how it looked before,

But

Down here, there is no longer a class title on the H one. So the simplest way to
control how something looks is just to find the template that renders that and
override it completely. Using this themes directory structure. Let's do that next. To
customize what it looks like when you render an asset field from content full, like
this image field or running from content full on the skill page.

