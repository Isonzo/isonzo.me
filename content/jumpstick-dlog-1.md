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
I was taking inspiration from **Super Mario 64**'s development cycle, where they tried to make sure the movement by itself was fun before developing the rest of the game

