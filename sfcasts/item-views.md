# Item Views

When it comes to customization, you can do *a lot* of damage by looking at which templates are rendering and using the theme system to override them. *But* there *are* a few cases where you'll need to get even more specific. For example, suppose we want to modify the item template for skills on the homepage. If you check the web debug toolbar here and scroll down... I'll actually search for "contentful"... ah, there we go... you can see `grid.html.twig` and that it's rendered via `/item/contentful_entry.html.twig`. To override this, we *could* override that template. *Easy peasy*. But the *problem* is that, in Contentful, we have *multiple* content types. We have Skills *and* Advertisements, so if we override this template, that will override it for *both* Skills and Advertisements, and we *probably* want those to look different. So how do we solve this?

Earlier, we ran
```terminal
./bin/console debug:config netgen_layouts view.item_view
```

and talked about the two main sections under here - block_view (that controls how blocks render) and item_view. As I've said a few times, *some* blocks, like Grid and List, render individual items. This item_view config is where we define *those* templates. And you'll see the same root keys: `default` for frontend, `ajax` for AJAX calls, and `app` for admin. Once again, this uses the `match` config and... hey! We see our entry in here! Remember `recipes_default`? We configured this inside of our config file, and it's one of the two *real* item templates we have right now. There's one for recipes, and then Contentful has one for *all* of the Contentful items. So again, we *could* just override this template via the themeing system and be done. But our goal is to override this template *only* when the item is a skill, like this one. So how do we do that? This is where we can add our *own* item_view to this list that matches that single content type. Let's do it!

Over here... we're under `item_view`, `default` for frontend, here's `recipes_default`, and now let's add a new one. I'll call it `contentful_entry/skill`, though this particular key doesn't make a difference. Below that, we'll set the `template` to `@nglayouts/item/contentful_entry`, followed by `skill.html.twig`. Before, we were using `nglayouts` *without* the `@`, just as a nice standard. These are *identical*. We've now learned enough to know that, in reality, Layouts always uses `@nglayouts`, which basically hooks into the themeing system. As long as we have a `/templates/nglayouts` directory with `/themes/standard`, it's going to use our template. So when we're configuring templates using `@nglayouts` and `nglayouts`, it's completely identical. It doesn't matter, so the *real* key here is the `match`.

We know we'll want to match *only* when we're working with a `contentful_entry`, so I'm going to copy this `match` right here. But we need to be more specific than that. We need to specify *only* when the *type* of content is a skill. But what matchers are available? There *is* a core list, but did Contentful add any *additional* matches that we could use? Here's a little trick to see the *true* list of matches, and it's a *little* technical. We can run:

```terminal
./bin/console debug:container -tag=netgen_layouts.
view_matcher
```

It turns out, you can actually make a custom matcher, like "foo\bar". To do that, you need to create a class and give it this tag. By looking for all services *with* that tag, we can find *all* of the existing matches in the system. And... awesome! Look at that list! And check this out - `contentful\content_type`. I'm guessing we'll be able to say `contentful\content_type` and set that to `skill` to get this to work.

Okay, let's go create a template for that. Inside `/theme/standard`, instead of `/block`, this time, we're going to create a directory called `/item`, and then `/contentful_entry`, and *then* `skill.html.twig`. I'll just put some dummy text in here for now. All right, if this is working, when we refresh, these items here, which are Contentful skills, should re-render using that template. When we try it... absolutely *nothing* changes. What happened?

Go back to your terminal and run

```terminal
./bin/console debug:config netgen_layouts view.
item_view
```

again. Let's check our matches on top. Look at the order that they're in. This one from Contentful is on the *top* of the list and our new ones are at the bottom. Guess what? When Layouts is trying to figure out which template to render, it reads the list from top to bottom, like routing. The first thing it does is look at this `contentful_entry`, sees that the `value_type` is `contentful_entry`, and it uses *this*. It never makes it to the stuff at the bottom.

To fix this, we're going to use a fancy prepend configuration trick. Let's do that *next*, and finally finish our template.
