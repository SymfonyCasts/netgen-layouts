# Contentful Layout

The Contentful integration we just installed will add two things to our site. First, it will add Layouts integration, for adding new value types, query types, and that sort of thing. Second, it's giving us the ability to instantly give all of our content on Contentful its own URL and page on our site. The second part has *nothing* to do with Layouts. A minute ago, we used this handy dandy `contentful:routes` command to see that there should now be a page at `/mashing`. When we went there, it didn't give us a 404 error, but it *didn't* exactly work. The page is nearly empty.

Let's see what's going on here. I'm going to click the Twig icon in the web debug toolbar to see what templates are being rendered. Let's see here... If I go down to this view, you can see that it's apparently rendering this `NetgenLayoutsContentful/contentful/content.html.twig` template. Tht must be the template for this page. Let's go check that out.

I'll search for `content.html.twig` - we want the ones from `layouts_contentful` - and... *congratulations*. This is the template that's rendering for that page. You can see that it's rendering `content.name`, but the reason we don't see this is because it's rendering it into a `block` called `content`. So this eventually extends `base.html.twig`, and since our base template never renders `block content`, we see *nothing*. Again, this part of Contentful where you get a URL that renders a controller, that *then* renders a template *automatically*, has nothing to do with Layouts. It's just a nice way to expose every Contentful item as a page on your site.

Unrelated to Layouts, if we wanted to, we could override this template in our application and change it to work. We could change it to override `block body` and use this `content` variable, which represents the piece of content, to render all of the different fields you need. But... *hold on* a second. That's the whole point of Layouts. It lets us build this page dynamically. Right now, this page ian't linked to a layout. But if we *did* link it, we could start building the page using data from the matching Contentful skill - in this case, from the "Mashing" skill.

So let's do this! Head over to our admin section, publish that layout, and then create a *new* layout. I'll call it "Individual Skill Layout" and choose "Layout 2". Eventually, I'll make this look more like "Layout 5", but I don't need to do that now. I can choose "Layout 2", and once we're editing our layout, we'll have the flexibility to create multiple columns however we want. That's one of the reasons why I really like "Layout 2".

Okay, let's start how we normally would. I'll close the web debug toolbar so we can link the header to our normal header and our footer to our shared footer. *Awesome*. I'll go see if things are working... starting with a Title block, and... *nice*. And then, I'll publish this layout.

Next, we need to map this layout to that URL. So far, we've been mapping routes either by the route name or the URL, also known as the "Path info". In a few minutes, we're going change the URL for this page from `/mashing` to `/skills/mashing`. When we do that (let me add new mapping here and hit details), we could then use the Path info prefix to map everything, starting with `/skills/`.

*But*, one other thing that you can add to Layouts is another way to map or resolve which layout should be used and which page. And Contentful actually added two new ones: Contentful Entry and Contentful Space. When we go to one of these special Contentful pages, the dynamic route stores which Contentful Entry (meaning which piece of content is stored there), as well as which Contentful Space we're in. Right now, "Space" is a term for your *entire* site on Contentful. When you go to one of those dynamic pages, pieces of information are stored *internally*. If you go to a *normal* page, it won't have those pieces of information.

Thanks to this, we can leverage one of these new targets to see if it matches. We could use Contentful Entry, for instance, and point it at a specific item inside of Contentful. *Or*, we could do what I'm going to do and use a Contentful Space. We only have one Contentful Space, so it's pretty easy. Basically, we're saying:

`If we are on *any* Contentful dynamic URL, I want
you to match this layout.`

So let's save this, and then we can actually link this layout to our individual skill layout. Hit "Confirm" and... good! Let's head over and refresh and... it works! Yes!

As I mentioned, we actually have *two* types of content. We have *Skills* and *Advertisements*. Advertisements aren't really meant to have their own page - only skills are. So if we wanted to, we could go back to this layout linking the details, and in addition to the Contentful Space, we can go down here to this list of conditions and select "Contentful content types". This is a way to make, make your matching more specific. I'll add that condition, and this is a little hard to see here, but I can select "Skill" or "Advertisement". Let's select "Skill", save changes, and... now this will *only* match our skill pages. Nice!

At the command line, you can see that my advertisement, which is actually this funny looking URL right here, is actually available as a page at the moment. We'll fix that in a few minutes, but at the very least, if we went to that weird URL, the page would work, *but* it's not going to be matching any layouts because of our mapping. So we *now* have control over Contentful pages. Cool! But all we have right now is a manual title.

Next: Let's make our layout smarter to render *real* content from the matching skill.
