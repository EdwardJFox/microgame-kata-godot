# Gold Digger

Faithful recreation of the original microgame in WarioWare GBA. Press the spacebar when your finger is all lined up with the nostrils.

## Code rundown

This kata is made up of two entities: a nose and a hand.

The hands only job is to move consistently left and right at a regular interval, around the rough extents of the nose so you can miss the nose or hit any part of its collision. It does this in the `_physics_process`. Internally it has 3 states: moving (going left to right), entering (moving towards the nose) and stopped, where if it has gone past the vertical cut off for the movement animation it will stop.

The nose is in charge of detecting where the finger has collided. It has 5 seperate collision boxes, so that a different animation can be played depending on where the finger ends up and wins can be detected. In the screenshot below, they are colour coded where red is a lose, and green is a win. Each of these collision shapes are children of a single Area2D, which uses the index of the collision shape inside this Area2D to determine which part of the nose has been hit. You can see this in `_on_Collisions_area_shape_entered` in `Node.gd`. I have no idea if this is the best way to do it, but it makes sense to me!

![Screencap of the editor, showing the collision zones of the nose](/minigames/gold_digger/collision_screenshot.png)

## Reusable entities used

- Border
- InstructionText
- Timer

## Screenshots

![Screenshot of Gold Digger running on Windows](/minigames/gold_digger/screenshot.png)