# Frontend Item

Coming soon...

All right, let's work on the front end item view. So we can see our recipe items
here. So this starts almost exactly the same. In fact, I'm going to take our
configuration down here and paste. So if app is the admin key, default means your
front end section. So under here, again, this key is not important. I can call it
recipes defaults, but it doesn't matter. And then for the template, we'll just change
it to the same thing, but front end. And then the item value type is gonna be exactly
the same. So cool, nothing new there. All right, let's go create that template in NG
layouts. I'll make a directory called front end. Then it's outta there. Recipe
underscore item dot html, that twig.

And

This will be past the same variables as our admin item template. So we know there's
gonna be an item dot object, and we can call the name property on our recipe just to
see if things are working and it is working, it's live. And one of the cool things I
like about using layouts when I start talking about templates is click down on the
twig item in the web d toolbar, we can actually see how layouts is rendering. You can
see it renders layout underscore two point htma qug. And then down here it starts
rendering our zones. It renders our navigation block, it renders our hero block. And
then eventually down here you can see this is where our grid is rendered. And because
we are using, you can see it renders a grid called three columns. That's actually
something we, we actually wanted four columns in ours. This is something we can
control in our admin areas. If you click on the grid right now, we're on the content
tab where we control really the content that's in there. There's also a design tab
where we can change this to four columns and I'll hit publish and continue loading.
So this, if we refreshed it in a second, would now render four underscore columns
that hhl twig, and then inside of each column it renders our recipe underscore item
that hgm of that twig. So just really cool to see this. We're gonna look at this more
later. It's gonna be the key to helping us, um, understand which templates we can
override to customize things further.

Now, one thing I do wanna point out that is that our applications using bootstrap
four, not bootstrap five. And the reason is actually because right now the grid
layout actually uses a bootstrap for friendly markup. So if you wanted to use
bootstrap five, you would actually need to override these column templates, like that
column underscore or four underscore column html. That twig we were just looking at a
second ago. I can even show you that you can actually override that to change these
classes here. And we'll talk about how to override core templates in a little while.
All right, let's bring these little things to life here. So open up the homepage
template, so main homepage.ht twig, and scroll up to where we loop over the latest
recipes. Perfect. What I basically wanna do is just steal all of the markup for one
of these recipe tiles here. And then we're gonna paste that into the front end
template. Now we just need to tweak some variables. It's not going to be recipe that
slug, it's gonna be item dot object dot slug. So I'm actually gonna do a little find
and replace here, replace recipe dot with item dot object dot

Replace all. And let's see if that worked. Move over, refresh. And it does. That
looks like the front end. That's awesome. Except it, you can see it has, it's missing
the gutter that we have here. So if I inspect element, you can see the difference is
we have columns here, but they're inside of a container that gives us that, uh, extra
margin. If we look up here, we're inside of a robe or we're not inside of a
container. So we don't get that extra gutter on the side. So to fix this in layouts,
we can add a, our, our favorite guys a column, move the grid into that column.
Actually, I don't need to do that. And then click wrap in container and I'll hit
publish. Continue editing. Refresh. Now, whoop, I actually clicked on one of those.
Here we go. Go back there. Got it. It's inside of that container. Now notice I also
could have just gone onto the grid and clicked rapid container there. Um, the reason
I'm putting this inside of a column that's inside the wrapper is that we can also
move this latest recipes into that column. So this is an H two. So let's go over
here. Let's add a new title header, put it inside of our column. Get outta here.
Apple,

Say latest recipes, change us to an H two. So it's inside the column, so it's gonna
be inside of the container, publish and continue editing refresh. And even closer. So
now is we need to center this and maybe give it a little top margin so you can see
how we can just build this out little by little. So I'm actually gonna use the CSS
class on this. I'm gonna add text dash center and NY dash five. That's from
Bootstrap. And you can see I'm getting this over from the same stuff that I actually
have on that H two inside of my template. Now if we try it, look at that, it matches
it exactly, that's what I'm talking about. Except now we actually have control over
the recipes inside of here. We could change to a different query. Uh, in a little
while. We could even change to selecting manual items and they will show up here on
the front end. We can also now embed this anywhere we want on the site. So to
celebrate, we don't need this stuff down here anymore. We don't need any of this
logic. So I'm gonna delete the latest recipes block entirely. And also we can save
ourselves some trouble in a controller. So in source controller, main controller
right here, we don't need to query the latest recipes at all,

And we don't need a pass any variables into our template. Also remove the rest
repository argument and the use statement. So really nice cleanups on the front end.
When we refresh, we just have one latest recipe coming from our dynamic block. So you
can see down here, I'm still wondering the tweak block latest recipes that doesn't
exist anymore. You can see layouts doesn't throw an air, it just doesn't render it.
But obviously we don't need that anymore. So I'm going to delete that block and let's
just publish and continue editing one last time to make sure things look good. And
they do. All right, next, now that we have this grid inside of a inside of layouts,
we can do some cool stuff with it, like enabling a Jack's powered Page Nation.

