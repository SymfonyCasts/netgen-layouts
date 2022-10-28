# Block Plugin

Coming soon...

Hey, we've made it to the last topic of the layouts tutorial. We've now transformed
our static site into one where we can reorder the layouts, mix it with custom things
that we built on our site and over at the Temple, the templates in many different
ways to customize the look and feel. We haven't covered everything you can do and
customize in layouts, but I hope you're feeling dangerous. One thing we haven't done
is create a totally new block, but this is documented and at this point it wouldn't
be too hard. Why would you build a custom block? Well, suppose you have something
super custom like this. Subscribe to your newsletter field here, which is actually
powered via live components and then submits via Ajax. The simplest way to solve this
would be the way that we solved it in this tutorial way that I solved it in this,
which is just to do it inside of Twig,

Okay?

And then include that block inside of layouts. But if you needed this functionality
on multiple pages and you want to be able to, that is one. Creating a custom block
would be useful. Anyways, let's do one last challenge related to blocks. A block a
plugin. So if you go to a particular skill, you can see that we could probably use a
little more margin between these blocks, and that's a pretty common thing to need. So
I wanna make this easier to do. Let's go to our layouts and then up edit the
individual skill layout. All right, so here's my goal.

We wanna add a little margin right here. So I'm gonna be able to click on any block
in my system. For example, this column block. And over here on the design side have a
new dropdown option where I can just select the top or bottom margin from a menu. So
this means what we're gonna do is we're actually gonna be over, We're gonna be
extending and modifying existing blocks in the system. In this case, every block in
the system, that's the job of a block plugin. So to create one, we'll go to the
source layouts directory. Let's create a new PHP class called How about vertical
white space plugin. This needs to implement a plugin interface, or more commonly
you'll extend a plugin class, which takes care of some of the work for us. The only
method that we need if we go to code generate or Command N, is called get Extended
handlers. So each block that you have in the system over here has something, a class
behind it called abl uh, a handler. And what you're gonna return in here is basically
the in an iterable of all of the handlers that you wanna override. So for example, if
you wanted to just extend the title block, then you could

Yield the title handler like that on class. But in our case, we want to actually
override everything so we can yield block handler interface on call on class, because
it turns out that every block handler has to implement this interface. So by doing
that, we are now hooking into every single block. All right, next I'm gonna go back
to the code Generate menu or command N of the Mac and go to override methods. And
we're gonna override build parameters. This is where you can, and we don't need to
call the parent method because it's empty. This is where actually you actually build
custom options that go on there. So I'm gonna say builder arrow, add, you're past
this Parameters builder interface, which kind of is like a form builder actually just
gonna paste in one here. And then for this kind of missing you statement here on top,
I'm just gonna paste in this kind of custom uh, prefix. So that's a pretty common way
to do it. So you could say it's a boo type that comes from neck ends, has a default
value of false. Here's the label and the self group design. Remember, sometimes
there's a design tab and other times there is a content tab. This is where you're
deciding which spot you want to go into.

And this key here, Vertical whitespace enabled is just the internal name of this
field. You'll see how we use that in a minute. So if we refresh now and click on any
block, like our title block, we don't see it. Oh, let's see here. Let's clear our
cash just to make sure this class should be seen automatically via auto
configuration. And we are yielding, Oh, there's the problem. This should not be block
handler interface. My bad yield block definition handler interface calling class.
There we go. That's the right one. So you can see I was basically overriding nothing.
So now if I try that again, now that I've fixed my mistake, we should be able to
click on any block inside of here. And yes, we have an enable vertical white space.
Sweet. So if we don't wanna just enable it, we wanna be able to choose like how much
top or bottom we need. So to do that after this field, I'm gonna paste in it to other
fields. These are basically just like the top. The biggest difference is that up here
we said builder arrow add. Now we say builder arrow get, and we get this one and then
we add it. So these are kind of child fields under this one. And the way that that
works is pretty cool over here, if we refresh and click on any,

Actually let's go down to the one we want here. Click on our column, enable VER to
walk eye space. And as soon as you click that, those sub options show up. So let's do
medium top spacing and no bottom spacing. Well publish that. And no surprise when we
go over here and refresh, absolutely nothing happens. We've added those options, but
we're not using them anywhere yet. We need to override a template to do this. Now in
this case, we want this top and bottom margin to apply to every single block on the
system. So fortunately, every single block on the system eventually extends block dot
html dot twig. This one here with NG layouts in it. So we're gonna do is copy this
and then override this using the themeing system. So if we follow the path here,
engine themes, standard engine theme, standard block, and instead of block, it's
called block that HTM on that twig. I'm gonna paste that there,

<affirmative>.

And then just so we can see if this is actually working, I'll put a little test right
there. So refresh the front end. Yikes. Yep, definitely working. So let's take that
out. So at the very top of this, there's a variable called CSS block, which has some
basic um, CSS classes. And then it also reads via block dot parameter, a CSS
parameter. This comes from this CSS class thing right here. And then it does dot join
to bring those together. So what I'm gonna do is actually take off that pipe join,
I'm gonna cut that and the name this rename this to CSS classes. We're kind of
setting things up so we can modify that variable. And then down here, right before
block content, we're going to kind of recreate that CSS class variable set to CSS
classes, pipe join space. So there, the CSS class variable is used in lots of
different templates, so we need to make sure that's still set. It's used down here,
but it's also using the content block of lots of child templates. So we need to make
sure that's set. But up here, we now have this array, which is gonna be nice cuz it's
gonna allow us to modify things really easily.

So anywhere between here I'm gonna say, I'm actually gonna paste three variables
here. So we're doing here is using block dot parameter, and we're reading the value
of that which is equal to the name that we gave it inside of here. So we're reading
all three of those values. And then very simply, oh no, so we can use this below to
say if you use white space. And if,

And once again, I'll kind of paste in some code here. So we set CSS classes to the
existing thesis classes and merge in this like white space, dash top class. Um, and
then this white space top is going to be equal to just like the string, like none
small, medium or large. And then the same thing for white space bottom. So I'm just
making up these CSS classes. These are not things that we, there's not part of like
bootstrap or anything like that, but if you look at my styles, oh, up here we go,
actually prepare these before the tutorial. So they should automatically pick those
up. All right, let's try it, move over, refresh and got it. So you see a little extra
white space there. And that's coming from the fact that we have this nice new white
space, top medium class. Sweet. All right, that's it. Friends, you're now a layouts
ninja. Let us know what cool things you're building with it and if you have any
questions, as always, we're here for you down in the comments section. See you next
time.

