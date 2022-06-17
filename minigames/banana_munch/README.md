# Banana Munch

Faithful recreation of the original microgame in WarioWare GBA. Press the space bar to eat the banana before the timer runs out!

## Code rundown

The main thing here is the Banana scene, which handles all the interaction in this microgame. It uses godots `_input` method to wait for the action button to be pressed, which in this case is the spacebar. Once pressed, it increments the progress, and moves the sprite animation on one to the next state of the banana being eaten. Like the original game, it has a basic shake animation attached to it.

The other entities are strobing stars making up the background, and have a basic two frame animation to match the original game.

## Reusable entities used

- Border
- InstructionText
- Timer

## Screenshots

![Screenshot of Banana Munch running on Windows](/minigames/banana_munch/screenshot.png)