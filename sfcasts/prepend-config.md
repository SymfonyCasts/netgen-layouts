# Prepend Config

Coming soon...

I'm pretty sure that our new configured item view here is configured correctly. We
have value type Contentful entry. I know that's correct. Uh, and then we're using
Contentful content type set to skills that only applies to our skills from content
vault, but it doesn't seem to be working on the front end. We saw second ago when we
were on Debug and Fig that the problem is the order of our config layouts goes from
the top to the bottom when trying to figure out which item template to use. So at
first looks at this one here, sees that the value type is Contentful entry and just
stops. To fix this, we need to reverse config. Why is it in this order in the first
place? Well, it's just how Symphony loads config. It loads vendor config first, like
from our Contentful package. And this is actually from net and layouts itself. And
then it loads our config and it's usually the order that we want things. In this
case, we want the opposite. How do we accomplish that? By asking Symphony to prepend
our configuration. So to do this first in the config directory, I'm gonna create a
new directory called Prep Pens and I'm gonna move our neck end layout configuration
into it.

I'm doing this so that Symphony stops automatically loading our config in the normal
way because it you, cuz it loads everything config packages via the normal system. So
at this point, nothing is loading this pre pens directory. The next step is a little
technical. It's to create what's called an extension class. I'm gonna call it app
extension. And then I'm just gonna paste in the code. You can grab this from this
page. Basically, when this prepend function is called, we're simply going to go load
that file that we just did from the prep pens and then we basically push it onto the
configuration. So this is kinda a long way of loading that configuration file, but
because it's happening in this pre, but we're doing it in a way that's going to
prepend that configuration. Now, to get this file to be called, we're gonna go to our
kernel class and make a little bit of a strange change in here after this used
Microkernel trait. We're gonna say configure container as a base configure container.
So what we're doing is we're actually saying the configure container method from
Microkernel trait, which looks like this. We are going to alias that into this class,

But we're now going to rename it as base configure container. The reason we're doing
that is that we, I'll copy this. Configure container method from the traits can now
define our own configure container. I'll hit okay to add the use statements and then
still call this arrow base configure container and pass in those arguments, container
loader and builder. What the configure container method does in the trait is it's
actually responsible for loading all of the config package directory, services, dot
yaml, all the normal stuff we want. So we still want that to happen, but then after
it does that, we're gonna say builder arrow at register extension, new app extension.
So a little bit technical here, but those two pieces together are going to cause our
configuration file to be pre penned. So check it out. Let's rerun our DBU and fit
command. Again, scroll to the top and yes, our configuration is now on top. And when
we refresh,

Woohoo.

Content full skill. And you can see this in the layouts web debug toolbar. If you go
over to render blocks, Let's see here. Block definition. Oh nevermind. All right, we
don't see that there. Nevermind. All right, let's finish this template. We already
have what we want the featured skills to look like. So let's go to templates, home
main homepage, htma twig, Find featured skills, and we'll copy what one of those
skills looks like. We'll copy that into scale. Do HT l, that twig. And I'm also going
to put a little dump on top of dump item dot object. We've done item temples before,
so we know item dot object should give us the underlying object, the Contentful
entry. All right, I'm gonna refresh that. Awesome. So this is an intensive Contentful
entry and you can't really see it from here, but the most important thing to know
about it is that it has a get method where you can read any of the underlying data
from content full. So in this case, if I actually check out what that looks like, I
have fields called like title, short description. We can use those keys to read off
of those. So for example, on the H three here, I can say curly curley item dot object
dot get title,

And then over here that rendered the title. All right, so let's finish everything up.
Uh, everything else up for the image source, that's actually going to be item dot
object dot get image. And then from there it's file dot url that's specific to
Contentful. And I'm also gonna go over to the alt and say item dot object dot get
title there as well. And the last thing is the url. This is a little bit weird. It's
specific to how our dynamic pages are being created with our CMS system. So in this
case, the the dynamic UR URLs are being added by the CMF routing bundle. So to add
the routes to link to, it's gonna be CF underscore routing underscore object. And
then you pass in this kind of technical underscore route underscore object set to
item dot object. If you were using sillus or IUs cms, you would use some function
from their system to create this link. All right, let's try that. And amazing, yes,
if we click on it, it works. All right, so let's celebrate by getting rid of that
dump. And you know what else? Let's actually take the featured skills stuff out of
our template, our homepage template. We don't need that featured skills at all
anymore,

And we can kind of remake that H two inside of our admin area. In fact, let me do
that real quick first while we're here. So let's do a title featured skills. Want
that to be a heading two. We'll give it maybe that same CSS class, text center and
before. Awesome. And I have this inside of a container. Let's actually do add a
column here. I'll wrap that in a container, and then we can move our grid and our
title inside of there. And we won't need a container right there anymore. And I'm
gonna delete this featured skills block down here entirely. Cool. Let's publish and
continue editing. I'll delete featured skills out of here entirely. Move over. And
how cool is that? All right, while we're talking about item views, let's customize
the item template for our other content model Inside of content full, the
advertisement, we're only rendering this in one place on a specific skill page. We
are rendering it over here. So let's go check out that layout real quick. I will open
the individual skill layout. So as a reminder, we did this by using the content full
entry field, and we are using an advertisement, which is a referenced entity. So over
here,

If you modify a skill, you can see that the field down here is actually a way where
you can select dynamically select related entities. Well, it turns out when you use
this referenced entities thing, entries thing, if you like your web D bug toolbar and
search for item, it'll actually scroll down here. This is actually you once again
using the item template. You can see here, here's the content, full entry field
entries dot html, that twig, and then it kind of loops over all of you related
entries. And for each one renders the item template. And this is rendering the
standard item template so we know how to override that. That's head over to our
configuration. We'll copy the content full entry skill, and now we have content full
entry. Let's call it ad call, the template ad at HML Twig. This is all gonna be the
same, except this is going to be called advertisement because over in content full,
our content model is called advertisement. You click that and go to the JSON preview.
Nope, we're not gonna do that. All right, so let's go create that template down over
here. Create a new file called add dot h chamber, that twig,

And I'll just say advertisement. If we click back, refresh. Got it? That was easy.
All right. For the real tempo contents, I'm just gonna paste this in once it gets
used, item do object.gi, it reads the URL field. There's an image field and a short
text field on each advertisement. And now we've got it. All right. Next, what if we
wanted to create a grid of items on our site, but make just that one grid look
different than all the others? We can do that by creating an extra block view for an
existing block.

