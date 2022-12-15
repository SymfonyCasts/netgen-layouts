# Custom Item View Type

The Grid of skills on the `/skills` page looks *terrible*. Let's go find the layout
for that: Skills List Layout. Ok, so this is a *normal* Grid... and it renders
like any *other* Grid on the site. I want to *customize* this, but I don't necessarily
want the Grid block *itself* to render differently: having them tiled like this is
perfectly fine. What I *really* want is for each *item* inside the grid to render
differently, but *just* in this one situation. How can we do that?

## Hello "Item View Types"

Head over to your terminal and run our favorite `debug:config` command, this time
looking at `block_definitions`:

```terminal-silent
./bin/console debug:config netgen_layouts block_definitions
```

This is, as we learned, the *config* for all of the blocks in our system. Check this
out! One piece of config we haven't talked about yet is called `item_view_types`.
For each "block view type", like `one_by_two`, `list`, or `grid`, there's also
`item_view_types`. So far, every single entry currently has a single one called
`Standard`.

It's not *super* common, but for a given view type - like `one_by_two` or `list` -
you can actually specify *multiple* ways to render the *items* inside of that view
type. Those are called `item_view_types`. This `Standard` is the default, and that
means it will render each item in the "normal" way.

So here's our: for the existing `grid` view type, we're going to add a *new*
"item view type". On a high level, this will allow us to choose a *different*
way to render items in a grid.

To start, over in our configuration, find `block_definitions`. We currently have
`list`, `view_types`, and `one_by_two`. *Now* add `grid` so we can override that
existing view type. Add `item_view_types` and add new one called, how about,
`skill_big_view`. You'll see how we use that key in a second. Give this a name:
`Skills View View`.

What did that do? Refresh the admin area... click down on the Grid... and make
sure you're on the "Design" tab. Hey! We have a new "Item view type" select!
It shows "Standard", which is the default, then our new "Skills Big View"!

Select it and hit "Publish and continue editing". What will this change on the
frontend when we refresh? Absolutely nothing! That's because we now need a new
"item view" that will *match* this.

## Adding the "Item View" for the new "Item View Type".

Back in our config, scroll down `item_views`. Below `default`, copy the
`contentful_entry/skill` section and paste it *above*.

We're putting it *above* because order is important: we need this *new* item view
to match *first*. Watch. Call it `contentful_entry/skill_big_view` and change
the template to
`@nglayouts/item/contentful_entry/skill_big_view.html.twig`. We *still* want to
match when `item\value_type` is `contentful_entry` and `contentful\content_type`
is `skill`... but *only* if the matcher called `item\view_type` equals the key
we created earlier `skill_big_view`.

Thanks to this, if the user selects this as their "Item View Type" for a grid
of skills, then all *three* of these will match. But if we used the normal
`Standard` view type, it would *not* match this... but it still *would* match the
one below.

Let's go add the template. Inside `item/contentful_entry/`, create the new file:
`skill_big_view.html.twig`. Inside, say `BIG VIEW`.

Cool! Let's try it! Make sure the layout is published... then on the frontend...
we got it! Awesome! The rest is easy. Since We've already created several item view
templates, I'll paste in the rest of the template. There's nothing new here.

But now... yea, *that* is the look we're going for.

## Changing the "Item View" on an Item by Item Basis

By the way, now that our "Grid" block view has multiple item view types configured
below it - that's our configuration up here - we have the power, on an item-by-item
basis, to override that. See this "Override slot view type"? This basically says

> Hey! I want to change whatever the first item in this list is to use the
> "Standard" view type.

I'll hit "Publish and continue editing" and now... you can see that just the *first*
item uses the Standard view type! That's... obviously not what we want on our site,
so I'll go back and use "No overrides". But *that* is a very powerful concept.

And... woh! Just one chapter left! One common problem with Layouts is working with
vertical spacing: just making sure the spacing is correct between all of our
components. We *could* control that by adding CSS classes to individual blocks. But
wouldn't it be nice if *every* block in the system had a nice drop down where
we could select the top and bottom margins automatically? How can we make a
modification to an *existing* block, or even *all* blocks in our app? That's the
job of a *block plugin*, and that's *next*.
