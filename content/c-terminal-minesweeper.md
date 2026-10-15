---
title: "C Terminal Minesweeper"
date: 2026-10-14T21:28:16-05:00
tags: [dev, portfolio]
summary: A lightweight, vim-navigable minesweeper clone built in C using the ncurses library. A good time waster.
image_dir: "c-terminal-minesweeper"
image: minesweeper.png
draft: false
---

I recently dug up a project I built like five years ago.
It's a fully playable minesweeper clone running on the terminal.
Of course, it didn't work initially because according to the commit messages, I decided to refactor it.
Somehow I managed to forget to allocate the cursor pointer.
I fixed it by just allocating it on the stack, because there wasn't a good reason for it to be dynamically allocated in this particular use case.


### Demo

<script src="https://asciinema.org/a/69H3HCr11IJr43rw.js" id="asciicast-69H3HCr11IJr43rw" async="true"></script>

(Note this isn't really playable on the browser, you'd have to compile it with the make file from the [github](https://github.com/Isonzo/Csweeper))

### Architecture
The main difficulty I recall was the cascading reveal when you activate a large empty space.
I used a recursive flood-fill approach, as shown below:
```c
// If 0 adjacent mines, automatically select all surrounding tiles
if (mine_count == 0)
{
    for (int i = -1; i <= 1; ++i)
    {
        for (int j = -1; j <= 1; ++j)
        {
            Pos temp_cursor = *cursor;
            temp_cursor.y += i;
            temp_cursor.x += j;
            
            // Bounds check before recursive call to prevent memory violations
            if (is_in_bounds(&temp_cursor)) {
                if (map[temp_cursor.y][temp_cursor.x].icon == '#') {
                    // Recursive flood-fill
                    selectTile(&temp_cursor, map); 
                }
            }
        }
    }
}
```

Overall an extremely simple project, but one brought to completion.
It technically still has a bug where you can simply flag the entire board and win, but that's just up to the player at this rate.
