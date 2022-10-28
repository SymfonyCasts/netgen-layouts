# Item Views

Coming soon...

So when it comes to customization, you can do a lot of damage by looking at which
templates are rendering and using the theme system to override those. Boom. But there
are a few cases where you'll need to get even more specific. For example, suppose we
want to modify the item template for skills like on the homepage. If you check the
web debug toolbar on this page and scroll down, let's actually search for content
full for perfect. There you go. You can see the grid and then apparently it's
rendered via content item slash contentful underscore entry dot H two twig. So to
override this, we could override that template. Easy peasy. But the problem is that
in content fold, we have multiple content types. We have skills and advertisements.
And so if we override this template, that's gonna override it for both skills and
advertisements, but we probably want those to look different. So how do we solve
this? All right, do you remember that bin when we were around bin console debug
config? Earlier we were around bin console debug config, net gun layouts view, and we
talked about the two main sections under here, block underscore view that controls
how blocks S render, and the other item underscore view.

So as I've said a few times, some blocks like grids and lists, if I go back and look
at the homepage layout, there we go. Some blocks like grids and lists, render
individual items. This item underscore view config is where we define those
templates. And notice again, the same root keys default for front end ajas for AJA
calls and app for admin. So once again, this uses the match config and hey, we see
our two entry, we say our entry in here, remember recipes underscore default. We
configured this inside of our config file, and it's one of the two real item
templates we have right now. There's one ours for recipes, and then Contentful has
one for all of the Contentful items. So again, we could just override this template
via the themeing system and be all done. But our goal is to override this template.
Just when the item is a skill, not a is a skill. Like if I go back to the homepage,
this skill here. So how do we do that? This is where we can add our own item view to
this list that matches only that content type. So let's start this

Over here. We are under item view. We are under default for front end. Here's our
recipes one, let's add a new one. I'm gonna call it content full underscore entry

Slash skill, though remember this key does not make any difference at all. And then
below we'll set the template to, I'm gonna say at ng layouts slash item slash
content, full underscore entry. And how about skill dot html, that twig. So notice
before we're using NG layouts just as a nice standard I'm not using at NG layouts.
Those are identical. We now have learned enough to know that in reality, layouts
always uses this at NG layouts. And that basically hooks into the themeing system.
And as long as we have a templates slash ng layouts directory with theme standard,
it's gonna use our template. So when we are configuring templates using at NG layouts
and NG layouts is completely identical, so it doesn't matter. So the real key here is
the match. Now we know we're gonna wanna match only when we are working with a
content entry. So I'm gonna copy that matcher right here, but we need to be more
specific than that. We need to say only when it's the type of content is a skill. But
what matchers are available, there is a core list. But did Contentful add any
additional matches that we could use? Well, here's a little trick to see the true
list of all matches. It's a little bit technical. We can run bin console deva
container dash tag equals net gin underscore layouts dot view underscore matcher.
Turns out if you wanna make, you can actually make a custom matcher like food slash
bar. And to do that, you need to create a class and give it this tag. So by looking
for all services with that tag, we can actually find all of the existing matches in
the system

And awesome. Look at that list and check out down here, content full slash content
type. I'm gonna guess that we're gonna be able to say content full slash content type
and set that to skill to get this to work. All right, let's go create a template for
that theme standard. Then instead of block this time, we're gonna have our first
directory called item and then content full entry, and then skill html dot twig. And
I'll just put in some dummy texts for now. All right, so if this works, we're gonna
refresh. And in these items here, which are Contentful skills, should re render using
that template. And when we try it, absolutely nothing changes. So what happened if we
had active terminal run that bin console command again for debug, config, and check
out our matches on top, Look at the order that they're in. The ones from content,
this one from content folds on the top of the list and our new ones at the bottom.
Well guess what? When layouts is trying to figure out which template to render, it
goes from the top of this list down the bottom, like routing. So the first thing it
does is it looks at this content full entry. It sees that the value type is content
full entry, and it uses this, It never gets down to our stuff at the bottom.

To fix this, we're gonna do a fancy pre penned configuration trick. Let's do that
next and then finish the template.

