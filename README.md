# Microgame Katas - Godot

My personal solutions for the game dev katas at https://microgamekatas.dev, built in Godot 3.4. The aim of these solutions was to be as accurate to the original game as possible. I am a huge fan of WarioWare and retro game archive efforts, so I wanted the chance to replicate them as close as I could, while learning more about Godot!

## File Structure

- **assets** - Contains any globally used assets, such as sprites for the timer and the fonts.
- **autoloads** - Any Godot singletons go here. Currently just used for loading the WarioWare font.
- **entities** - Similar to the assets folder, this is for re-used entities/nodes across microgames, such as the border and timer.
- **microgames** - Where all the logic for each microgame goes. Each game is given its own folder, with its own similar structure as the root folder to store its content in (assets, entities). If you want to see the kata code, this is where you should go!

## Assets

All the art assets are taken from [The Spriters Resource, WarioWare, Inc.: Mega Microgames!](https://www.spriters-resource.com/game_boy_advance/wariowareincmegamicrogames/) page, and are created originally by Nintendo and all rights are theres. This is an open source project, of me learning how to make games, and in no way should its content be used commercially.

The following users submitted sprites to Sprites Resource which I used:

- lemurboy12
- Jackster

From their sprites, I used Aseprite to make them suitable for the katas.

## Technical aspects

Each microgame is designed to be run at the GBAs native resolution of 240x160, but I believe you can resize the window and it will add black bars to the edges to ensure it keeps the same aspect ratio.