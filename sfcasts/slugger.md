# Slugger

Coming soon...

Before we go further into customizing the look and feel of things on our site, I
wanna fix the URL so that instead of just slash mashing, its slash skills slash
mashing. Now remember the fact that our Contentful content instantly has URLs on our
site, comes from the Contentful package we've installed earlier, but actually doesn't
have anything to do with layouts. So customizing the, this URL is also specific to
Contentful, not layouts, but I really want to fix it. So let's do that. It's pretty
easy. Over in the source layouts directory, let's create a new PHP class called
Contentful Slugger. This is gonna be a class that's called when the, um, Dynamic
Route URLs are determined. Make this implement entry slugger interface and then I
will generate the one method we need get slug. So what we're gonna do is we're gonna
set things up so that this method is called for every single content full entry. And
then we can figure out what it's URL should be to help with the kind of slugging
process. We can use a filter slug trait, and that's gonna give us a helper method
that we'll use in a second. Now on our site over here in content, we actually have
both skills and advertisements. We don't really want advertisements to have their own
page, but,

But with the content full integration, we're using this. A advertisements will also
always have pages. I'll talk more about that in a second. But what I want you to
realize is that this is gonna pass us both skills and advertisements and we're gonna
handle them separately. So I'm gonna use the new PHP match function to match for a
content full entry arrow, Get content type arrow git id. What that's going to return
to us is a unique id, sort of a slug that's associated with each of these. So
advertisements, it's hidden in here a little bit. No, let's not actually show that.
So for example, for for skill, it's just gonna be the string skill and we'll say
slash skills slash, And then this arrow filters slug that comes from the filter
trait. That's just gonna create a nice slug from a string. And then we can pack this
content full entry arrow gi, and then we can get the tidal field off of our skills.
And the other one, oops, the other one's gonna be called advertisement. And I'm just
going to have these be all just be slash underscore a e d. So,

And then down here, I'm going to default to throw new exception invalid type. So
again, advertisements will have their own page. I don't really want that. There's not
a way to turn that off. It has nothing to do with layouts. But if I were worried
about this in a real application, I would probably set up a symphony event listener
that would determine if the currently matched route was one of these advertisement
routes. And if it was, I would trigger a 4 0 4, but this is fine enough for me. All
right, to hook this slugger up until content full about it, we need a tag. So let's
add auto configured tag.

This one's called net gen underscore layouts dot contentful entry underscore slugger.
This also takes an array called type. And here you can use whatever string you want.
I'm gonna say default underscore slugger. We're gonna reference this next in a config
file. So up in config packages create a new file called net gen underscore layouts
underscore contentful dot yaml. So we're configuring the Contentful and layouts
bundle and put that as the root net gen layouts full. And then below we see entry
slug type. And then default, we say for all in all cases, I want you to use our
default underscore slugger it. So a little bit of some funny syntax here, but this
says in every single case call our default slugger, which is going to be identified
to be our content full slugger. So this is not called When you Reload the Pages. This
is called When You Actually Sync your Content with Content Full. So to get this to
take place, we're gonna need to run Symphony console content Full sync. You'll be
kidding me. Symphony Console content full sync and it works. But if you run content
full routes, you'll see that the URLs didn't change. This is a little quirk of the
library. Once the routes are imported, those URLs don't change.

So the easiest way to do is we're actually just gonna drop that routes table, re-add
it, and re uh, import stuff. So it's kind of cool. We can actually run Symphony
console doctrine, MI migrations migrate Current minus one. How cool is that? We'll go
back one migration, which is actually gonna drop those tables, and then we're gonna
migrate back up to re add those tables. And now we'll run content full sync and check
out content full routes and got it slash skills in front. So over here slash mashing
is now gonna be a good old fashioned 4 0 4, but slash skills slash mashing works.
Yay. All right, next, we don't yet have a page that shows all of the skills. Let's
fix that.

