# Contentful Layout

Coming soon...

The content full integration we just installed will add two things to our site.
First, it will add layouts integration, like adding new value types, new query types,
all that kind of stuff. Second, it's giving us, giving us the ability for every
content we have on Contentful to instantly have its own URL and page on our site. The
second part has nothing to do with layouts. A minute ago we used this handy dandy
content, full routes command to see that there should now be a page at slash mashing.
When we went there, it didn't 4 0 4, but it didn't exactly work. The page is nearly
empty. All right, let's see what's going on here. I'm gonna click the twig icon in
the web view of our two of our to see what templates are being rendered. Let's see
here. If I go down to this view, you can see that apparently it's rendering some neck
hand layouts, Contentful content dot html, that Twig template. Let's go check that
out. That must be the template for this page. I search everywhere. For content H two,
we want the ones from layouts content full and congratulations. This is the template
that's rendering for that page

And you can see that it is rendering content.name, but the reason we don't see this
is it's rendering it into a block called content. So this eventually extends a base
study. Each chima twig and since our base template never renders the content block,
we see nothing again, this part of content full where you get a URL that renders a
controller, that then renders a template automatically has nothing to do with
layouts. It's just an extra, It's just a nice way to get expose every content full
item as a page in your site. Now, unrelated to layouts, if we wanted to, we could
override this template in our application and change it to work. We could. We could
change it to over I block body and then print out all of the different, and use this
content variable, which represents the piece of content and render all the different
fields that you need. But hold on a second cuz that's the whole point of layouts. We
can build this page dynamically. Right now, this page is not linked to any layout,
but if we did link it, we could start building the page using the data from the
matching content full skill in this case from the mashing skill.

All right, so let's do this. Head over to our admin section. I'll publish that
layout. Let's create a new layout, I'll call it. How about individual skill layout?
And I wanna choose layout two. I'm actually eventually gonna make this layout look
more like layout five, but I don't need to do that. Now. I can choose layout two. And
in, once we're editing a layout, we have the flexibility to create multiple columns
however we want. So that's one of the reasons I really like layout too. All right,
let's start a normal way. Let me close the web D book toolbar so that we can link the
header to our normal header and our footer to our shared footer. Awesome. And I'm
just to see things are working. I'm gonna start with a title block. Awesome. And then
let's publish this layout two. Next, we need to link this layout, map this layout to
that url. So far we've been mapping routes either by the route name or the url, also
known as the path info. In a few minutes, we're gonna change the url, this page to be
from slash mashing to slash skills slash mashing. When we do that, let me add a new
mapping here and hit details. We could then use the path info prefix to map
everything starting with slash skills slash,

But one other way that we can. But one other thing that you can add to layouts is
another way to map or resolve which layout should be used and which page in content
full actually added two new ones. Content, full entry and content full space. So when
we go to one of these special content full pages, the dynamic route stores, which
content full entry, meaning like which piece of content is stored on there, as well
as which content full space we're in right now. Space is kind of a word for your
entire site on content full. So when you go to one of these dynamic pages, those
pieces of information are kind of stored internally. If you go to a normal page, it
won't have those pieces of that information. Thanks to this, we can leverage one of
these new targets to see if it matches that. Like we could use content full entry and
point it at a specific item inside of content full. Or what I'm gonna do is do a
content full space. So we only have one content full space, so it's pretty easy. But
basically we're saying if we are on any content fold dynamic, you were url, I want
you to match this

Layout. So let's say save, and then let's actually link this layout to our individual
skill layout. Hit confirm, and good. All right, let's refresh and it works. Yes. Now,
if we wanted to, as I mentioned in our content, we actually have two types of
content. We have skills and advertisements. Advertisements aren't really meant to
have their own page only skills are. So if we wanted to, we could go back to this
layout linking hit details. And in addition to the content full space, we can kind of
go down here to these condition things and select content, full content types. This
is a way to make, make your matching more specific. So I'll add condition, and this
is a little hard to see here, but you can see I can select skill or advertisement.
Let's like skill, Beautiful save changes. And now this will only match our skill
pages. So you can see at the command line the my advertisement, which is actually
this funny looking URL right here that actually is currently available as a page.
We're gonna fix that in a few minutes, but at the very least, if we went to that
silly url,

That page would work. But it's not going to be matching any layouts because of our
mapping. So we now have control over content full pages. Cool. But all we have now is
a manual title. Next, let's make our layout smarter to render real content from the
matching skill.

