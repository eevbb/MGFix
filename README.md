# FGFix

A Full Metal Schoolgirl mod.

## Changes

* Pantsu fully uncensored

  * All black voids under the main character's skirts are removed.

* Characters won't disappear when the camera is close

* Unlocked free camera

  * Get as close as you like to characters!

  * Move the camera through objects, and as far as you like as well.

* Custom skirt physics

  * No more silly constraint that prevents the back of skirts from flipping.

  * Skirts are alot floppier and react more to character movements.

  * Skirt physics can be customized as well in the `main.lua` file.

* Hide the drone during vent crawling animations

  * Usually the drone blocks the girl's pantsu when she's crawling.

  * This can be disabled in the `main.lua` file.

* Unbind the middle click button

  * This is hardcoded to center the camera during gameplay and cannot be changed, which is pretty silly. If you'd like to restore this keybind, you can do so through the game's keybind configuration (the binding is set to RShift by default).

* Underwear selection! Stick to your favorites!

  * Press `Ctrl+1` through `Ctrl+7` to choose. Your selection updates when you enter a new floor.

## Download and installation

[Download💖](https://github.com/eevbb/MGFix/releases/latest)

Extract into the game folder. If you're updating from a previous version, replace all files **but back up your `main.lua` first if you made any changes**, you'll have to copy them over manually.

**Also** make sure to delete the old `Uncensor_P` files in the `~mods` folder when updating from an old version, if they exist. I changed the name of the pak since it's not just an uncensor mod anymore, and it does more things now.

If this is your first time installing the mod, you'll have to install UE4SS as well. [Download the latest experimental version](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest) (the zip file that *doesn't* say zDEV) and install it.

## Customization

Locate the main.lua file found in `MG\Binaries\Win64\ue4ss\Mods\MGFix\Scripts`, and change any values you want there.

There are comments to help you understand what each value does!

## Changelog

* New in 1.3

  * Change skirts so all bones are affected by physics

* New in 1.2

  * Unbind middle click button

  * Greatly extend free camera range

  * Underwear selection

* New in 1.1

  * Add customizable skirt physics

  * Add option to hide drone when vent crawling

* New in 1.0

  * Remove black voids

  * Disable character fade out when the camera is close

  * Remove
