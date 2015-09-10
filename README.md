# punk.AnimatedTilemap
An extended Tilemap class that allows defining animated tiles in Flash- and HaxePunk.

I really needed a simple class for a game project that enabled me to use animations in my level graphic. It's basicly a bit of a Frankenstein's monster of the Tilemap and Spritemap class, but it does the job.

The end result looks something like this:

![alt-text](https://cloud.githubusercontent.com/assets/2915643/9775750/0134a508-5752-11e5-90c5-a9740392f60b.gif "This could be your game!")

Also figuring out how the hell this github thing works..


## Features

* Animated Tilemaps!
* As many animations as you like
* Each animation can have different amounts of frames and different framerates
* ???


## How to install

Basicly just copy over either the HaxePunk or FlashPunk version of AnimatedTilemap to your game and you're ready to go!
(You can also copy it into your *Punk directory)


## How to use

Using AnimatedTilemap is really easy, it works much like the Spritemap class. But I have written a small guide anyway to make it a bit simpler:

#### I.

So first of all you are going to need a tileset graphic. Let's use this one:

![tilepoke](https://cloud.githubusercontent.com/assets/2915643/9776200/42bd08cc-5756-11e5-8587-9263b89e3e14.png)

Each tile is **32x32 pixels**. As you can see, there are 2 animation in there: One in the second row for the flowers bobbing around and one in the bottom row for the water animation.

#### II.

Draw a level with this tileset in your level editor of choice (I use Ogmo) like you would with a normal tileset.

When you want to draw some animated flowers or water in your level, make sure to **draw them using the first frame of their animation** in the tileset (so use the first tile from the left in this case). This is going to be important later.

#### III.

Now to create the tilemap in your game, instead of adding a normal Tilemap, **make an AnimatedTilemap**:

```haxe
var tilemap:AnimatedTilemap = new AnimatedTilemap("assets/your_tileset.png", 256, 96, 32, 32);

addGraphic(tilemap);
```

(For a tutorial on how to use Tilemaps or how to import Ogmo levels in *Punk have a look at www.youtu.be/TPPzgB3fv8A)

#### IV.

Now this should already work like a normal Tilemap. To add animations just do this:

```haxe
tilemap.animate([8, 9, 10, 11], 1);
```

This syntax is really similar to Spritemaps, where the **first parameter is an Array of frames** that you want as your animation and the **second parameter is the framerate** at which to play the animation.

The frame index also works just like it does with Spritemaps, basicly you just count all the frames in your tileset starting at 0 and you get which frame index your animation is at.

So if you wanted to also add the water animation, first look at the tileset (Okay, the water animation has 3 frames) and count at which index the frames are (The first frame starts at index 16) and:

```haxe
tilemap.animate([16, 17, 18], 1);
```

You can add as many animations as you want! (But you should probably not overdo it...)

#### V.

And that's it already!

The animations will start automatically when the AnimatedTilemap is added and will loop on their own. Pretty easy.


## Issues and Credits

My code is horrible and I am a horrible person.

If you have any suggestions on how to improve this, for example performance-wise, please let me know or create a pull request or something. I just wanted to share this with anyone that could use it and I am certain there is lots of room for improvement.

If you have any questions how to use this or maybe ideas for new features please let me know as well!

voec at posteo dot net
