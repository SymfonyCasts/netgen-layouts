# Twig Blocks

Coming soon...

So we just completely replaced our homepage with a dynamic layout, but that's not
really that interesting. What I really wanna be able to do is use my existing
homepage template and all this good content I've prepared, but then be able to tweak
it by adding little bits of dynamic content here and there, or even by rearranging
sections to do that in the layout, go down into the bottom to a special block called
TWI Block. And let's just put that right below the title. Notice you can put things
in their own zones, or you can put as many blocks as you want inside of a single
zone. These zones don't really end up being all that important anyways. When you
click a block on the right side, you're gonna get block options. And this one has an
important one called Twig Block name, where I'm gonna put body matching the block
body I have in my template. Now here, let's hit publish and continue editing and then
go over to refresh the homepage. And holy Toledo, our Static Twig content is inside
our dynamic page. That's awesome. And everything still works. Even my fancy live
components powered part of my page here.

Okay, so this is cool, but it's still kind of like dynamic content on top and then
static content on the bottom

<laugh>.

So to make this more flexible, we can just add more blocks to our template. So for
example, I'll keep block body there, It doesn't really matter too much. And let's add
Block Hero around our top part below that, a block called How about latest recipes
and block one called Block Subscribe newsletter and Block. And finally down here, one
called Featured Skills with an end block at the bottom. Now, if we just have those
blocks, that makes no difference to our app, we're still rendering the body block
down here, which includes all of those. But we now have a lot of flexibility here.

Check

This out. Let's change this body block here to render the hero block. And then let's
add a couple more. Uh, another trick block here. Call this latest recipes. And by the
way, this block labels just for your, just for you for clarity. So I could put latest
recipes here and you can see that kind of shows up on top. Totally optional. And
let's add two more blocks for the two other blocks. Subscribe newsletter. Yeah, I
know I'm using the word blocks to mean two different things. And finally, this last
one will be called featured skills. And then up here, I'm actually going to remove my
title block temporarily. I don't need that. So now I'm running those four blocks.
Let's say publish and continue editing. And then go check out the front end. Sweet.
Our page is back, and I know it looks exactly like it did a second ago, but it's now
being rendered by layouts. Do you see the power? We now have the ability to, for
example, rearrange stuff. So watch, I'll move this subscribe newsletter down to the
bottom, hit publish and continue editing Refresh. And boom, that static part of our
site is now at the bottom of the page. Man, that is so cool.

Or we could move that back up and we could include like dynamic content if we wanted,
like text right in between one of these other blocks. Next, let's get even more
aggressive and flexible by allowing the top navigation and bottom footer to be
optional, but easy to add inside of a layout.

