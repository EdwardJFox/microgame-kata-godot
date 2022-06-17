# Body Block

A mostly faithful recreation of the original microgame in WarioWare GBA. Move your body left and right to stop the watermelon falling off the screen!

## Code rundown

We have two main entities here, a body and a watermelon.

The body is what the player controls, and has a basic left to right movement. When the player hits the edge of the screen/the border, they bounce back a little bit keeping them somewhat in the middle. There is some janky code in it to try and figure out what layer the player has collided with. If its the border, then we want the player to bounce, but if its the ball (from above) we want the player to animate with a little wriggle animation seen in the game.

The watermelon picks a random point along the top of the screen, and a random angle to come at the player with. From there, it moves at a constant rate, bouncing at the same angle when it collides with something. I tried to show this in the editor with a debug line horizontally to where the watermelon is. It works perfectly fine if you move the watermelon via the transform panel, however when you use the mouse it doesn't update. This dev line also more than doubles the number of lines of the Watermelon GDScript, so while it was a fun experiment, I am not sure it was entirely worth it.

![Screenshot of the editor showing the deubg line of the watermelon](/minigames/body_block/editor.png)

The bottom of the screen there shows the "lose" area, where if the watermelon collides with that section then the game has been lost. To accomplish this, I split the screen border up into 4 separate parts, with each being individually masked (or collectively masked as just a single "layer", up to you!). This allows the watermelon to collide with the top and sides, but not the bottom.

## Reusable entities used

- Border
- InstructionText
- Timer

## Screenshots

![Screenshot of Body Block running on Windows](/minigames/body_block/screenshot.png)