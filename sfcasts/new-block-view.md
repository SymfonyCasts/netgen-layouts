# Custom Block View

So here's the plan. We're going to add a new "view type" to the list block
definition. Then we're going to map that to a *template* via `block_views`.

## Updating the "Block Definition"

For step 1, open our `netgen_layouts.yaml` file and, really anywhere, add
`block_definitions`. This config can be used to create totally *new* blocks or
change options on *existing* blocks, which is what *we* want. To do that, we
need to repeat the config here: `list` & `view_types`. So, `list` `view_types`
and then add the new one. Let's call it `one_by_two` - that key can be anything -
and give it a name: `1x2 Featured Grid`:

[[[ code('f915c763bf') ]]]

*Just* by doing that, if we go over and refresh the admin area... and click down
on the grid, we have a new view type! If we change to it... nothing renders in
the admin area. And if we hit "Publish and continue editing"... over on the
frontend... *also* nothing renders. Yay!

Click the Layouts link in the web toolbar and... near the bottom, ah. It's rendering
`invalid_block.html.twig`. The block definition *is* `list` and the view type
*is* `1x2 Featured Grid`. The problem is that we haven't, yet, defined a "block view"
for that combination. So, it falls back to "invalid block".

## Adding the Admin Block View

Ok, under `view`, we've already created several "item views". *Now* add `block_view`
so we can create our first of *those*. We're going to register both an admin
view as well as a frontend view. Because... in the admin area, it currently
renders nothing. Add `app` for the admin and the next key doesn't matter. For the
template, because the admin view isn't too important, let's re-use the core admin
"grid" template, which you could find via the `debug:config` command. It's
`@NetgenLayoutsStandard/app/block/list/grid.html.twig`.

*Now* add `match`. We want to use this template if `block\definition` is `list`
*and* `block\view_type` is `one_by_two`... making sure that this matches the key
we used earlier under the block definition:

[[[ code('ca2aa09e2d') ]]]

How did I know to use `block\definition` and `block\view_type`? By using our favorite
`debug:config` command! That's always a good guide to follow.

Anyways, that should fix the admin area. And... it does!

## Frontend Block View

For the frontend view, duplicate that entire section... but use `default`. This
key is fine, it doesn't matter, and change the template to, how about,
`@nglayouts/block/list/one_by_two_list.html.twig`. The match section is
perfect already:

[[[ code('0aa857f379') ]]]

Ok, let's go make that template! We already have
`templates/nglayouts/themes/standard/block/`... so, create the new `list`
subdirectory then the file: `one_by_two_list.html.twig`. Start by saying `1x2`:

[[[ code('6f5ab178f7') ]]]

Let's check it! Over on the frontend, refresh and... there's our tiny 1x2!

## Customizing the Frontend Template

Let's bring this to life! Because this renders a "list" block, our template probably
has access to some variable that represents the "items". To cheat, which is *always*
a good choice for developers, let's peek at the core grid template:
`grid.html.twig` from the `themes/` directory.

Wow! Like many core templates, there's a lot of stuff in here! You can choose what
you want to keep or get rid of. The most important thing is this `collection_html`
variable: they loop over `collections[collection_identifier]`... where
`collection_identifier` is actually just the word `default`. So it loops over
`collections.default`. Then it includes a template. That `templateName` variable
will be set to something like `grid/` the number of columns `.html.twig`. For
example, if the grid is configured to use 3 columns, it would use
`3_columns.html.twig`. That template adds the `div` needed for each column in a
3 column setup... and then calls `nglayouts_render_result()`. *That* renders
the "item".

Anyways, if you zoom out, the template basically loops over the `collections`
variable and calls `nglayouts_render_result()` on each one.

Back in our template, I'm going to paste in some code that does something similar:

[[[ code('59127b2fa6') ]]]

Yup, we extend `block.html.twig`, just like the core template does, then loop
over `collections.default`, add a `div` and render each item. So this is effectively
a simpler version of what a grid does.

And what does it look like? Refresh and... yup! It looks like a grid!

But remember the goal: one big skill on the left with two smaller skills on the
right. To make that happen, I'll paste in version 2 of my template. Nothing
special here. Instead of looping, this renders the 0 key, then the 1 and 2 keys:

[[[ code('c6deabab6f') ]]]

And now... yes! That's *exactly* what I wanted!

Though, I'll give you the same warning I gave earlier when we were overriding
core "item" templates. We are *not* including all of the custom stuff that lives in
the core template. If you need to support a custom option, make sure to include that
code.

## Hiding Block Options for a Block View Type

And actually, one thing in here - the number of columns - is *not* something we
need. This is something that we can configure for the block... but it's not
relevant at *all* when using our new view type.

Could we... hide that option when using our view type? Yep! Head back to your
terminal and debug the `block_definitions` config again:

```terminal-silent
php ./bin/console debug:config netgen_layouts block_definitions
```

Search for `one_by_two`. We *could* configure this `valid_parameters` key to
*remove* an option from the block. The `list` view type does exactly that.
I won't do it, but that's how it's done.

Ok, head back to the site and go to the "All Skills" page. Yea... things still don't
look right. On this layout, we're using a grid to render the items. And, that grid
looks ok on *other* pages but not here, where the skills are meant to be the
*main* content on the page. Next, let's learn how we can customize how these
*items* render for *just* this grid.
