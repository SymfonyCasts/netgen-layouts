# Item View Type

Coming soon...

The grid of skills looks terrible on the slash skills page. Let's go and find the
layout for that skills list layout. Awesome. So you're using this normal grid and so
it's normally like rendering like any other grid on the system. I wanna customize
this, but it's not that I want the grid block itself to render differently. Having
them tiled like this is perfectly okay. What I really want is for each item to render
differently, but just in this case, head of your terminal and run bin console, debug,
config, neck and layouts, block definitions. Once again, the config for all the
blocks in our system. Now check this out. One piece of config we haven't talked about
yet is called item view types. So for each block view type like one by two list or
grid, there's also an item view types. And in every single case right now, there's a
pre-built one in here called standard. So it turns out for a, it's not super common,
but for a given view type like one by two or list, you can actually specify multiple
ways to render the item inside of that block view. And those are called item view
types. Standard is the default and that means it's gonna render the normal whatever
the normal item you type is. So here's our goal for the existing grid item view type,
we're gonna add an extra item view type.

All right. To do that over in our configuration up here, we're gonna go to, there we
go, our block definitions. So we have list view types one by two. And now we're going
to add grid here. So we're gonna be modifying the existing grid view type, and we're
gonna be specifying item view types onto this. And I'm gonna create a new one called
skill big view. You'll see how we use that key in a second, and then we'll give it a
name. How about skills? Big view. Cool. Now as soon as we do that, if we go refresh
the admin area and click down here on the grid, make sure we're on the design tab, we
now have a new item view type standard or normal one or the skills big view. If we
select it and hit publish and continue editing and refresh, absolutely nothing is
different. That's because we now need a new item view that will match this. So scroll
down to our item views under underscore defaults and put this new item view above our
other content full entry skill. The reason once again, is order. We want our new one
to match first. Actually, let me copy the existing one. We have here,

I'll call it con slash entry skill big view, but that could be called anything. We'll
change the template to skill underscore, big view dot HTM on that twig. And we still
want these same value type, Contentful entry and content type skill. But then there's
another one we can use here called item slash view type set to the key that we used
earlier. Skill big view. So the idea is that if we selected this as our item view
type, then it's going to, when we hit this match, when we hit this here, all of three
of these things will match into the work. If we didn't select that and our view type
is standard, it would not match this, but it would still match this one down here.
All right, let's go outta the temple for that. It's down in our item directory
content full entry. And we'll have a new one here called skill big view HTML Twig.
And I'll just say big view. And then over on the front end, actually, just make sure
I actually published that. It works. Awesome. So now the rest is easy. We can just
customize that however we want. We've already done this a few times, so I'm just
gonna paste in some content. It's uh, routing to it using the fields. It's very
similar to what we had before,

But that is the look that we want on this site. More information. So cool. And also
now that we have have, now that our grid view type has multiple item views configured
below it. So this is thanks to our configuration up here, we now have the power on an
item by item basis to override that. So I'm not gonna do it, but see overrides slot
view type. This basically says, Hey, for whatever the first item is on the list, I
actually wanna change that to use the standard view type. So I'll hit publish and
continue editing. Now you can see that just the first item uses the standard view
type. So that's obviously not what we want in this case. So I'm gonna go back and hit
no override, but that is a very powerful concept. All right, next one common problem
on our site with layouts is working with vertical vertical spacing, just making sure
the spacing is right between all of our components. Now obviously we can do that by
adding CSS classes to our individual blocks, but wouldn't it be nice if every block
in the system just had a nice little drop down here where we could select top and
bottom margin automatically? How can we make a modification to an existing block or
even all blocks? That's the job of eight block plugin. And that's next.

