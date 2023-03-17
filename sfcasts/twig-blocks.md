# Adding Twig Blocks to your Dynamic Layout

So we just *completely* replaced our homepage with a dynamic layout. But, that's
not really *that* interesting. What I *really* want to be able to do is use my
*existing* homepage template and all this good content I've prepared:

[[[ code('edcd2bbc72') ]]]

but then *tweak* it by adding little bits of dynamic content here and there...
or even  rearrange things. To do that in the layout, under the blocks, at the bottom,
add a special one called "Twig Block"... and let's put that right below the title.
Notice that you can put as many blocks as you want inside of a single zone. These
zones don't really end up being *all* that important.

Anyways, when you click a block, on the right side, you'll see that block's options.
This has an important one called "Twig block name". Enter `body` to match the
`{% block body %}` that we have in the template:

[[[ code('ef72c4272f') ]]]

Ok, hit "publish and continue editing"... then go over and refresh the homepage.
Holy content batman! Our Twig content now lives *inside* this dynamic page. That's
awesome! And everything *still* works: even the fancy "live component" in the center
of the page.

## Adding More Blocks to your Template

Okay, so this is cool... but it's still just a bunch of dynamic content on top...
then Twig template content on the bottom: we can't *really* mix anything into the
*middle* of our page.

*Unless*... we add more *blocks* to our template. For example, keep the `block body`...
just so the page keeps working even if we *don't* map a layout... but then add a
`{% block hero %}` around the top section, a block called, how about, `latest_recipes`,
`{% endblock %}`, another called `subscribe_newsletter`, `{% endblock  %}` and a final
one called `featured_skills`, `{% endblock %}`:

[[[ code('7730b7f6c0') ]]]

If we stopped now, this would make *no* difference to our app: we're still rendering
the `body` block down here... which includes all of those. But we just gave ourselves
a *lot* of new power.

Check it out: change the `body` block name to `hero`. And then let's add a few
more Twig blocks. Render `latest_recipes` for this one. Oh, by the way, the
block "labels" are just for us in the admin area: just for clarity. If I enter
"Latest Recipes", that shows up above the block. Totally optional.

Add two more blocks: one that renders `subscribe_newsletter` and finally one
for `featured_skills`. Then, up here, I'm going to remove the `title` block for now.

By the way, I'm using the word "block" to mean two different things at once. Blocks
are the "things" we add to our layout - like a title, Google map, or list of items.
But blocks *also* refer to the Twig blocks in our templates. And of course,
one of the *types* of blocks we can add... is one that renders... Twig blocks.
A little confusing - but that's as bad as it gets.

Anyways, say "Publish and continue editing"... then go refresh the frontend. And...
sweet! Our page works. I know, it looks exactly like it did a minute ago, but
it's now being rendered by layouts... *and* we can rearrange the pieces!

Watch: I'll move the `subscribe_newsletter` down to the bottom, hit "Publish and
continue editing", refresh, and... boom! That static part of the page magically
moved to the bottom. That is *cool*.

Or, we could move that back up... then add some dynamic content, like text, in
between one of the other blocks.

Next, let's get even more aggressive and flexible by allowing the top navigation
and bottom footer to be optional, but easy to add, inside the Layout.
