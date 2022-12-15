# Item View Type

The Grid of skills on the `/skills` page looks *terrible*. Let's go find the layout for that - Skills List Layout. Awesome. So this is a *normal* Grid that we're using, and it's rendering like any other Grid on the system. I want to *customize* this, but I don't necessarily want the Grid block itself to render differently. Having them tiled like this is perfectly fine for our purposes. What I *really* want is for each *item* to render differently, but *just* in this case.

Head over to your terminal and run:

```terminal
./bin/console debug:config netgen_layouts
block_definitions
```

This is, as we learned, the *config* for all of the blocks in our system. Check this out! One piece of config we haven't talked about yet is called `item_view_types`. For each block view type, like `one_by_two`, `list`, or `grid`, there's also `item_view_types`. And every single case that we have right now has a pre-built one called `Standard`. It's not *super* common, but for a given view type like `one_by_two` or `list`, you can actually specify *multiple* ways to render the *item* inside of that block view, and those are called `item_view_types`. This `Standard` is the default, and that means it's going to render whatever the normal `item_view_type` is. So here's our goal: For the existing Grid `item_view_types`, we're going to add an *extra* item view type.

To do that, over in our configuration, we're going to find our `block_definitions`. We currently have `list`, `view_types`, and `one_by_two`. *Now* we're going to add `grid` here, since we're going to be modifying the *existing* Grid view type, and we're going to be specifying `item_view_types` *onto* this. Let's create a new one called `skill_big_view`. You'll see how we use that key in a second. *Then* we'll give it a `name`. How about `skills_big_view`. Cool! As soon as we do that, if we go refresh the admin area and click down here on the Grid... making sure we're on the Design tab... we now have a new "Item view type". There's "Standard", which is the default view type, and then we see our new "Skills Big View". If we select it, hit "Publish and continue editing", and refresh... absolutely *nothing* is different. That's because we now need a new item view that will match this. Scroll down to our item views under `default`, copy this `contentful_entry/skill`, and paste it above.

The reason we're putting it here, once again, is *order*. We want our new one to match first. I'll call the new one `contentful_entry/skill_big_view`, but we *could* call this anything. Now change the template to `@nglayouts/item/contentful_entry/skill_big_view.html.twig`. And we still want the same `item\value_type: contentful_entry` and `contentful\content_type: skill`, but there's *another* one we can use here called `item\view_type` set to the key that we used earlier: `skill_big_view`. The reason we're doing this is, if we select this as our `item\view_type`, when we hit this `match`, *all three* of these things will match into the work. If we *didn't* select that and our view type is `Standard`, it wouldn't match *this*, but it would *still* match this one down here.

Let's go add the template for that. It's down in `/item/contentful_entry`. We'll add a new one here called `skill_big_view.html.twig`, and inside, I'll just say `BIG VIEW`. Then, over on the frontend, I'll just make sure I published that first, and... it works! Awesome! The rest is easy. We can now customize this however we want. We've already done that a few times, so I'm just going make this quick and paste in some content where we're routing to it using the fields. It's very similar to what we had before, but that's the look that we're going for on this site - more information. *Cool*. Also, now that our Grid view type has multiple `item_views` configured below it, thanks to our configuration up here, we have the power, on an item-by-item basis, to override that. I'm not going to do this, but see "Override slot view type"? This basically says:

`Hey! I want to change whatever the first item on
the list is to use the Standard view type.`

I'll hit "Publish and continue editing" and now... you can see that just the *first* item uses the Standard view type. That's obviously not what we want in this case, so I'm going to go back and hit "No overrides". *That* is a very powerful concept.

Okay, one common problem on our site with Layouts is working with vertical spacing - just making sure the spacing is right between all of our components. We *could* do that by adding CSS classes to our individual blocks. But wouldn't it be nice if every block in the system just had a nice little drop down here where we could select the top and bottom margins automatically? How can we make a modification to an *existing* block, or even *all* blocks? That's the job of a *block plugin*, and that's *next*.
