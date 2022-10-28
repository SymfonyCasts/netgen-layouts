# Contentful Page

Coming soon...

So we now have full control over the content full pages. That's thanks to our
individual skill layout that we have mapped to the content full pages.

But all we have is this manual H one title. How can we render the actual data from
content fold? So first, if I go to content model and then click on skill, you can see
that this actually have has five different fields here. And each of these fields has
kind of an internal name. It's actually almost easier to see on this JSON preview.
Here we go. So there's a title field, it's internal name is title, short description
technique, and a few other ones like image and advertisement. And advertisement is
actually a link to that other type of content. Anyways, what I really wanna do is
actually print this title here up inside that H one. Fortunately, Contentful helped
us by adding a new custom block down here at the bottom. You can see there's a new
one called Contentful Entry Field. This allows us to render a single field from the
currently selected Contentful entry. So I'm gonna move that over here. Let's delete d
H one. We don't need that. And importantly on here, there, there's one important
thing, it's the field identifier. And we're gonna use this field called title. And
I'm gonna make this an H one

And the block label's always optional, but I'll include it here. All right, perfect.
Let's try publish and continue editing. Move over and awesome. It's dynamic. If I
started and if I went to one of the other URLs, one of the other skills, like the
basic chop, that works too. All right, so let's get fancier. I'm going to add a
column here. Let's move this skill into the column. And then I'm gonna give a column
that same hero rapper class that we had before. And you know what else? There's also
this, uh, short description. I'm gonna render that as text right below here. So
another content, full entry, I'll put it right there. And you see one of the things
here is view type. We're gonna talk more about that, but you want this to match the
type of, uh, content that's coming from content full. So, so far, title and this new
one short description are string types, and we'll leave that as div. All right, let's
publish and continue editing. See how that looks and oh, I love that. Cool. Let's add
more. Every skill has an image, so let's kind of keep it inside of this hero column.
Let's add another content, full entry

At the bottom. This one is going to be called image. And the type here is gonna be
referenced assets. And you do have to put a width and height heighten here. So I'll
do 200 by 200 and let's try that. Awesome. And let's do one last thing there. Let's
actually get the content down here. So now I'll go below that column. I can reuse the
same zone or I can use this. Zone. Zones don't really matter very much in this case.
What I actually want to do is put the kind of like the dr the the main text over here
and a little advertisement on the right. So to do that I'm going to, for the first
time, use a two column setup. And I'm gonna make this a 66, 33 so that the left side
takes up most of the space. And let's put a title inside of the left side here. I'm
gonna make this be an H three. The text will say the technique, so that's like how
you do it. And then right below that we will add another content, full entry field.
And this one, if I go look over here, yeah, is actually called technique. And this is
a rich text. So if you were to edit this inside of

Here, you actually see it's like a rich text editor. So it's gonna contain html. So
over here I can say technique only. It has a div, but we'll change this to be rich
text. Then final on this right side, I'm gonna use the last field. So content, full
entry. And this one, if I go back to my content model for a skill and scroll down a
bit, it's called advertisement. And this one is a referenced entry. So this is
actually a link when you edit this inside of, uh, here, which you can see is, is
actually a reference to another type of, uh, content in here. In particular a
specific advertisement. So a lot of different types of content in here. So I'm gonna
hit publish and continue editing refresh and sort of awesome <laugh>. We need a
container to bring those in. So let's see. We already have this here, so we can say
wrapping container there. And we can also use a little top margin here. So on that
same container, I'm gonna add an M Y dash three. Save that and much better. Now you
see this over here says advertisement field is not compatible with this block view.
Obviously that's something that we are going to need to work on.

Continental doesn't know how to render that related advertisement, so that's
something that we're gonna worry about soon. So awesome. This doesn't all look
perfectly yet, but we're gonna work on that soon. Next, let's fix the you URL here.
So it's slash skills slash mashing.

