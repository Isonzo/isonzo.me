---
title: "Jumpstick Dlog #2"
date: 2022-09-28T17:15:48-04:00
tags: ['dev', 'godot']
summary: 'Making graphics, aka how to make a game look good when you have no idea how to draw'
image_dir: "jumpstick-dlog-2"
image: 
draft: true
---

## The Art Problem
So I wanted to make some basic assets to give my game some sort of personality, as well as to decide on the final aesthetic for the game.
Now, the assets I made already looked decent, so there was no real incentive in investing time into this.
Even worse, it's generally recommended to leave art until as late as possible in game development, so what could I possibly have to gain from doing something like this?

The reality is that there is nothing to gain, and I did this because I wanted to.
To begin, I played around with trying to make a tile, under the justification that I would do this to start designing levels.
Of course, that makes no sense as I could've just used a solid color tile and be done with, but that was my headcanon.
So I made a basic tile, manually drew the normal map, and imported it. I then came to the realization that it didn't really fit.
It looked busy, and it was impossible to see the detail when I added an occluder.
I'm fairly certain a better use for normal maps would be for decoration objects and to more sparingly use light2D, but as soon as I was satisfied with seeing how this all worked, I moved on to something more likely to be actually used in this game.

Now, I know I said in my last post that I would try to use as few colors as possible, but unfortunately in the interest of trying to preserve some of the detail I already drew, I opted for larger palettes.
I worked on making a tilemap, the idea being that it could be a rusty overgrown lab and you're an abandoned subject for some sort of super-scout.
And so I made an autotiling tilemap, and it looked... messy.
However, now it was time to make the background atlas, such that I would just paint the background.
I draw something relatively similar to the tiles, hoping to continue with the abandoned lab vibe, and I painted the background.  
The result showed why exactly it was recommended so frequently to keep it simple, __especially__ if you don't know what you are doing.

Feeling shame, I typed `git reset --hard` and decided to do this right this time.
I cleansed myself of those pesky 10-color palettes and went with the [retrotonic 4-color palette](https://lospec.com/palette-list/retrotronic).

![What Retrotonic looks like under competent hands](https://cdn.lospec.com/palette-examples/retrotronic-palette-example-by-doph31mgxz.png)