# Block Views

Coming soon...

Let's override one other template completely on the skills page. Let me actually go
into the individual skill layout. We're using a Contentful entry here, which is a
reference asset, and it's rendering as this image tag. Cool. This is a great example
of how a single block type, which is a Contentful entry field, can have multiple view
types, which basically means multiple templates. So each of these, if I, each of
these different view types will be rendered by a different template internally. We
actually see this with lots of different block types, even the grid block type. I'll
temporarily put one down here. It has a view type that can actually go between list
and grid. It only turns out the only difference between a list, a list and a grid are
actually both the same block type. They just have a different view type, meaning
they're rendered by different templates. Let me delete that anyways. Every block type
can have one or more view types that you can then reference. And I actually wanna
dive a little deeper into this concept of, of views. So find your terminal and run
pin console debug config, net gun layouts view. What I'm doing here is debugging the
view configuration under net gun layouts.

Now if you do this, you are going to get a ton of content and there are several root
keys on here like parameter view and layout view and a few others. But there's
actually only two that we care about at all. Block underscore view, which we'll talk
about now, and item underscore view, which controls how the items in a list or grid
render. And we actually saw that earlier when we were customizing how our recipe item
would look in a list or grid. We're gonna talk more about those soon anyways, to zoom
in on the block views, we're on that same command, but at view dot block underscore
view. So block views very simply control how entire blocks are rendered. Like this
controls, for example, how the title block is rendered or the text blocked or the
list block are re is rendered. And this has a bunch of root keys like default app and
Ajax. And remember, we know what those mean.

Default means these are used on the front end app are used on the admin. And Ajax,
which is not as common, is is used. Used on the front end for ax calls. So when we're
talking about overriding templates, what we really care about is the default key. So
I'm actually gonna zoom in one more time by adding default.to default on the command.
So these are all the block views that are gonna be used on the front end. And the
trickiest thing about these are the match part. So when you define a block view, it's
common to define the template that should be used when two things match. And actually
let me search for a list slash grid here. This is a really good example. So this has
two matches. Block definition is set to list because technically the the block type
for both list and grid is actually called list. And then the second thing down here
is view type set to grid. So this is why if we add a, so if you are using the list
block definition and view type grid, you are gonna use this template right here in
both of these things, by the way, can be seen very clearly from the Web Depot
toolbar. So if I go to the homepage and go to the click on the layouts

Web toolbar and go to render blocks down here bit, here we go. Look at this, you can
see block definition, list view type grid, and then it points to the template that's
rendered for that. So in that case, that's referring to this grid right here. So then
why is the title block rendered by title html? That twig, we can actually see that in
this configuration. Let me search for title. Here we go. So you can see if the block
definition is title and the block view type is title used this template, this is an
example of a block type that only has one view type. There's not multiple different
block views. So really this means that when we're using the title block type, use
this template. So this kind of goes back to my, let's look back at our goal here. I
wanna override the template that renders this image right here. We know that this is
a content full entry field and it has a view type of referenced assets. So we can
actually find that in here. I'm gonna search for assets and here we go. So if you
block definitions, a content entry field and the view type as assets, this is the
that's being used internally and that is the template that we want to override.

So if we wanna override just the asset view type of the content field entry, that is
the template we need to override. Now of course we could have very simply, easily
seen this by going to the web toolbar and finding the template there, but now we
understand a bit more about how blocks are rendered and how each block can have
multiple views. So you can choose how they're rendered later. We're gonna add another
view to an existing block. All right, so let's get to work overriding this. So you
see we have the themes, standard n glas theme standards before, then we need block
and then this path right here. So instead our block directory, I'll create a new sub
directory called content full entry field. And inside of there a new assets dot htm,
all that twig. And I'll just start with asset. All right, if we go back to the front
end s it instantly sees it, we're now controlling that. All right, like before, we
probably don't wanna override the entire template. I'm gonna open the core template
assets dot each team on that twig so that we can steal from it. So temporarily, let's
just copy the whole thing here and yeah, that works.

And, and then you know, this stuff is complicated. There are content is fairly
advanced and and and complicated. And you can see that this kind of supports like
fields that are like a single image and no, so multiple images. You can keep this as
flexible as you want, but you can also just make this your own. So I'm actually going
to delete a bunch of stuff in here. In fact, I don't even need this block either. I'm
gonna replace it with a very simple image and I'm gonna print the url. You, you
would've seen this in the code that we had before. And then here, one of the things
you can do with content folds, if you wanna heighten width, you can say question mark
H equals, All right, I'm just gonna copy, I'm just gonna paste in this image tag
here. If you did a little digging, you'd find that this is how you get the url. And
also in content flow, you can add a little question mark. H equals and w equals for
width and height. And actually reading the height and width parameters from the
block. That means I'm actually reading this width and height right here. So it will
no longer render as an image

That physically has those as width and height attributes anymore. I'll just request
one from content, fold that size and let the image just be image element. Just be
whatever size it is naturally. So if you refresh and try that. Yeah, I think that
worked. Looks great. Now one thing you have to be careful about when you customize
these fields is you might not, might wanna make sure you don't lose certain flexible
things. So for example, right there, there's actually a spot where I can put a custom
CSS class on that image. Now if we did that right now, that's actually not going to
work because I'm simply not rendering those on my class right now. So that's fine. If
you wanna support that, you just need to make sure that you add that stuff in it. Say
class equals, and this is one of the variables that you saw would've seen before
Class CSS class. And then also while in here, I'm gonna add an alt attribute so that
to field dot value dot title. All right, Now when, Try that. Awesome. Love it. You
see there's our alt and there's our classes, including some core classes that con,
that layouts always puts on there. All right. Next we just talked about block views,
how templates are configured for block entire blocks. Next, let's talk about item
views and how we can customize the template that's used when rendering an item inside
of a grid or a list. We'll use this to style our skill items.

