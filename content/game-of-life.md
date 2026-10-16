---
title: "Game of Life"
date: 2026-10-15T00:21:10-05:00
tags: [dev, portfolio]
summary: Conway’s Game of Life is a zero-player game, meaning its evolution is determined entirely by its initial state. I'm sure you've read that a thousand times.
image_dir: "game-of-life"
image: game-of-life.gif
draft: false
---

> Conway's Game of Life is a zero-player game, meaning its evolution is determined entirely by its initial state.


A fast, interactive implementation of Conway's Game of Life built natively in C and compiled to WebAssembly.
I used the `raylib` graphics framework to handle the rendering, and when I remembered five years later that no one will ever compile a project, I played around with emscripten until it spat out a `.wasm` and `.js`.

### Live Simulation
*(Click on the canvas to place live cells, then press **'G'** to start or stop the simulation).*
{{< wasm src="game-of-life/gameoflife.js" >}}

### The Rules for Life
The grid is a 2D array of cells. Every frame, the engine checks each cell's neighbors and applies these exact rules:
1. **Underpopulation:** A live cell with fewer than two live neighbors dies of loneliness.
2. **Survival:** A live cell with two or three live neighbors finds the strength to go forth with another day.
3. **Overpopulation:** A live cell with more than three live neighbors dies from overcramping.
4. **Reproduction:** A dead cell with exactly three live neighbors is born from their polycule's love.

### Under the Hood
To make this work in a web browser without locking up the single javascript thread, I had to alter the original C code a bit.
It doesn't play nice with infinite while loops, so I had to hand it over to emscripten and encapsulate the logic in an `UpdateFrame()` function so it can all run asynchronously.

For accuracy, I use a **Double-Pass Resolution**, which is just a nice way of saying I calculate everything that's gonna happen in 1 pass, and the next pass I alter all the cells necessary.

```c
typedef struct {
  uint8_t state : 2;
  uint8_t isDead : 1;
  uint8_t age : 5; // 32 numbers
} Cell;
```
*(Each cell stores its current state and its future state, leftover bits go to age for this implementation)*

Most naive implementations juggle two entirely separate grid arrays: one for the current board state, and one to record the upcoming changes.
Instead, I tied the future state directly to the cell object itself.
This essentially allows the simulation to update accurately in place.

### Why do this?
By using C bit-fields, it has all necessary data in a single byte, even allowing me to tack on extra states, the most immediate one coming to mind being age to give a bit of visualizing flair.

#### Clean encapsulation
The reality is that this gives a very clean encapsulation.
The code, in my opinion, [is fairly easy to read](https://github.com/Isonzo/GameofLife).

#### Extensibility
Additionally, it's trivial to add additional features should I want to, like changing colors based on life time, having some sort of infectious state that can get passed on, etc.
A two array system would need potentially another array or something else to implement these changes, doing it my way keeps it simple.
By assigning more bytes, imagine all the little features you could give!

#### Avoiding a second array
Most Conway's Game of Life implementations have two full grids, one for the current frame and one for the next, so cells don't update while their neighbors are still being calculated.
By temporarily storing the upcoming transition in the state bits, the program can calculate the future without needing to have the hassle of a second buffer.


