---
title: "Jumpstick Dlog #1"
date: 2022-09-14T21:56:38-04:00
tags: ['dev']
summary: A dev blog (dlog) for a quick game
image:
draft: true
---
## What's going on?
So I decided to join the **"Godot Wild Jam #49"**, which had as a main theme **"Unstable"**.
The biggest requirement for the jam is using the [Godot game engine](https://godotengine.org/), for which I'm using [version 3.5](https://godotengine.org/article/godot-3-5-cant-stop-wont-stop).
So the first thing to do is to think of a game idea to execute.

My first idea was of unstable _structures,_ something along the lines of your main character having to defeat enemies in a building that took damage from both your attacks and the enemies attacks, and would collapse on you in different ways if supports failed.
It seemed promising, but it was just an idea in the idea board.
Then, expanding on that idea, I thought about giving the protagonist an explosive weapon in a building made of RigidBodies.
Although it was fun to think about, I had a feeling it would be too janky as I didn't have great experiences with Godot's RigidBody system.

The second idea was about unstable _movement_.
I got that after slacking off and being reminded of the existence of the Crypt of the NecroDancer.
Of course, it initially seems like the opposite of unstable, as it depends on moving to a very stable beat.
But it eventually led to me thinking about interesting movement mechanics, as that game was basically a dungeon crawler with its movement swapped by something non-traditional.
Following that line of thought, I remember those little Bennet Foddy style games, one of which was PogoStuck.  
Why not have something like that?

## Let's get on with it!
And so with a vague concept of how I want the movement, I boot up Godot with glee.  
It was a bit of a rocky start...

First I thought that using a RigidBody2D would make it easy peasy to develop as (in my mind) I would only have to set the physics material to make the bounciness not lose energy and make the input maps rotate the character.
It did not produce the results I wanted, so I instantly ditched the idea.

Instead, I went for a KinematicBody2D to have finer control over the physics of my character.
I wanted the movement to feel natural and fun, but also be _somewhat_ predictable.
I felt that some predictability would be good despite the theme, so that a player could develop some intuition on calculating their jumps.
I was taking inspiration from **Super Mario 64**'s development cycle, where they tried to make sure the movement by itself was fun, smooth, and responsive.
Once they achieved that, they said they ["knew they were halfway there."](https://shmuplations.com/mario64/).

So I started with adding some gravity and a jump function that would run everytime the KinematicBody2D detected it was on the ground.
I wanted the player to control it via rotation to direct this bounce, so it was a case of altering the character's rotation with the `A` and `D` keys.
I then made a Vector2 pointing up, rotated it by the amount the player was rotated, and multiplied the vector by a JUMP_POWER variable.
After that, I also added the player's previous `x` velocity, to simulate some inertia.
A couple of tweaks later, I had some pretty fun movement to work with!

To add some further complexity, I went with a shotgun  the player can both use to defeat enemies and to alter their velocity by using the recoil as some sort of knockback (think of Team Fortress 2's [_Force-a-Nature_](https://wiki.teamfortress.com/wiki/Force-A-Nature)).
So by drawin a vector opposite of where the gun is being aimed, I'm able to multiply that direction vector with a KNOCKBACK value, add it to the velocity, and the player gets a small jolt!
I think this'll help make the movement mechanics be a bit deeper than simply rotating the character at specific angles.

## Making it look nice
Now, I'm no artist. In fact, I'm rather terrible at drawing, which is why I try to focus away from art by either using free assets, or focusing on simple polygons.
However, I do actually want to try to become more well rounded and _at the very least_ be able to do some programmer art.
And so I boot up Aseprite and begin trying to make some sort of character.
Of course, I draw the arms on a seperate layer to later export it as a seperate sprite as I plan to rotate them individually.

I take the time to whip up a quick a shotgun shell to spawn as a particle 0.25 seconds after a player shoots, to simulate the pump-action.
I considered making the shot hitscan, but I found it simpler to make a generic bullet, which consists of a KinematicBody2D and a particle which emits a couple of particles rapidly as a trail.
Notice the color gradient to make the last pixels be white instead for some added flair!

### Ripping off TF2 once again...
In TF2 one shotgun pellet is always guaranteed to be accurate, the rest may scatter about in a cone.
Let's ~~steal~~ take inspiration from this system!

To fire a shot, we want to ultimately spawn the appropiate of bullets.
We can simply use a for loop going from 0 to 5, and if it's the first bullet, we fire normally, towards the mouse.
Otherwise, add a slight deviation.
We then organize bit masks and layers to ensure the player can't shoot himself.

We've successfully used our generic bullets as a shotgun blast!


## Wait a second, the gamejam you mentioned already finished!
Ah, you certainly are an observant reader.

I actually only developed this game mostly on a Sunday, the weekend the gamejam started.
The rest of the time, I would write this article bit by bit as well, to close off the dev sessions, most weekdays only adding a little feature at the end of the day (say, the shotgun shell particle and making it spawn at an appropriate time).

Unfortunately, I had a particularly rough week, both with work and social obligations, and so the game fell wayside a bit, with no way to make up for time.
I could've been cheeky and just ommitted mention of the gamejam, but I got my primary inspiration from the game due to their theme, so I thought that would be disingenous just to make up stuff.  
And so it remains...

But nevertheless, I think the game concept is good enough to try and make a finished game out of it, since I genuinely have fun moving the character around in the little sandbox.
So despite the time limit being long gone, I'll try my best to continue development for this game.
It certainly feels more productive than banging my head against the wall with online real-time multiplayer!

## What's next?
In the end, what was added to the game was the movement and the shooting, with some barebones graphical niceties added in.
What's next is to prepare a tileset to start building some levels, and try to establish some sort of graphical style for making assets.
I'm quite partial to trying to make a 4 color palette work, but I'm no artist, so I'll have to wait and see.
