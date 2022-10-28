# Skills Page

Coming soon...

Thanks to the Contentful integration we installed. In addition to our doctrine recipe
value type, we now have a second value type that can load things from Contentful. So
in addition to add a layout for IND the individual skill page, we can also now render
lists and grids of skills on other pages like over here on our homepage. So let's do
that. I am going to publish my layout. Get back. What I wanna do is edit our homepage
layout and I'm actually gonna remove our manual grid here. That's kinda a little
funny. Now, and down here for our featured down here, our featured skills are
currently render via twig block. They're just hard coded. Let's now actually add a
grid and over here I'll use Manual Connection and then check this out. We can now
choose between manually selecting Contentful entries or recipes. So let's just
pretend like we are going to select a couple of Contentful entries right there.
Beautiful publish and continue editing Refresh. And awesome. There they are. I mean,
they totally do not look right yet, but they are at least showing up. To make that a
little bit better, I'm going to go to the design tab here and let's wrap this in a
container.

Perfect.

They at least kind show up in the middle now, but you know, we really want them to
render like this, but we're gonna work on that in a few minutes. But first, what
about a slash skills page that shows all of the skills? Well, the Contentful
integration didn't give us this url, which is no problem. So we'll just create it
ourselves though. Thinking outside of the box, we could create a page content, type
in Contentful, and then create a skills page that becomes a slash skills URL on our
site. That might be how you would do things if you in a normal cms, but we'll create
the page the old fashioned way. After all, layouts is really about helping us
organize how existing pages look. It's not really about adding dynamic pages. That's
a job for a cms. All right, so let's go over and open up source controller. How about
main controller? I'll copy the route into action Right above this, the I'll be slash
skills, we'll call it app underscore skills and rename the method to skills. Then for
the template main slash skills dot htl twig, and in the template directory main,
let's create that. So skills dot htl twig. And we're gonna start with the smallest
thing that we could possibly need, which is that we extend that NG layouts dot layout
template.

Cool. While we're in here, let's open base dot html twig and link to this. So I'll
search for all skills. Perfect. There's our link. Now I can do a curly, Curly path
app underscore skills. Sweet. All right, refresh, try that top link and it works all
right to actually put content onto this page. We could also do that manually inside
of our code. There's nothing stopping us from doing that. The content full library we
installed earlier actually as a client interface service, which we could use to then
go fetch all of these skills from Contentful, pass those door template and render
them. Or we could cheat and let layouts query for the list of techniques for us.
That's what we're gonna do. But before we do that, go back into skills that HTML twig
and add a black TI block title. Say all skills and the block. This, as you probably
know, controls what shows up on the top of the tab. I'm doing that here cuz there's
no place in layouts. The title block is actually not something you can control via
layout. So we're gonna do it here. All right, now I'm going to hit publish on our
homepage layout.

Let's create a new layout. I'll do layout two, we'll call it skills list layout. And
I'm just gonna start with the basic stuff here. You guys know the drill. We're gonna
link the header zone, we're gonna link the footer zone. And then just to give us a
start here, I'm gonna do that same kind of hero wrapper grid we've been doing. So I
have a column, we'll give it a hero wrapper class. And inside of that I'll add a
title, all skills. And just to make things even cooler, we'll even add a little text
block right below that with some content. All right, let's publish that layout. And
then of course, now we have this layout, we need to link it to our slash skills page.
So we're gonna go over here and hit add new mapping. Let's link this to the skills
list layout. Then I'll go to details, and then we can, we can map this via request I,
uh, route name, whatever. I'm gonna use path info slash skills. So this will match if
the URL is exactly slash skills. Hit save changes. And let's see how our first
attempt was. And it was good. All right, the page is coming to life.

All right, now let's get to the good stuff. Head back to that layout, edit it, and
then below.

Oops.

Oh, actually I want skills list layout. So edit that. And below that column, let's
add a new grid. In this time I'm gonna change from a manual collection to a dynamic
collection. And we use something called content full search. That's kind of the main
is one, But you also say, I could choose latest recipes here. Content full references
is something different. So content, full search, this is a great one. You can choose,
uh, which content types you wanna show. Like all of them, we wanna show just skills.
We can sort them, we can even do a search term if we want to, and then skip items,
and then we will, and even limit the items. Awesome. And then you can also add more
manual items if you want to, but that doesn't make any sense here. All right, let's
try, let's see what that looks like.

Refresh, and, okay, that doesn't look good yet, but it's getting closer. One thing I
could have done, like I've done before, is give that a container so it looks slightly
better. But we can see the problem here. This obviously needs to be styled a lot
better. And on the homepage we have the same problem. That's where it's, where it's
rendering these same skill items in a very plain way. So clearly we need to customize
that. But to think about it even further, we're probably gonna want these skill items
to look one way on the homepage and a different way here on the all skills page. So
next, we're gonna start learning the very important topic of how we can override and
customize the templates from layouts so that we can make things look exactly like we
want.

