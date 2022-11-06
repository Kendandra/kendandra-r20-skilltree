# Vestillion Skill tress

Help doc here https://wiki.roll20.net/Building_Character_Sheets.

The `./src/` directory contains all the files you'd likely want to change to create your skill tree.

Note that Roll20 doesn't support any JavaScript in the actual display, so you will need to use raw CSS and HTML to style everything.  Additionally, what you can define in the `:root {}` CSS rule is restricted to basically only CSS `var()` style items.

To use images, you'll need to host them somewhere; I used `i.imgur`.  Small images could be Base64'd into the raw CSS, but I'd not recommend it -- Roll20 is finicky on it's security scans.

Finally, you cannot use most fonts unless you follow the specific `fonts.googleapis` instructions on Roll20's documentation.



# Building and testing

## Testing in Roll20's Sandbox mode

Roll20 provides a special Character Sheet Sandbox "game".  If you have Roll20 Pro you can access this.
Importing steps are similar to importing into a normal game, except you can do this from within the sandbox, rather than externally from the game settings page.  Follow the **Importing into Roll20** section below.

## Testing Locally

### VSCODE and WSL

By default the build system is setup using VSCode's `./.vscode/tasks.json` where the `default` task calls a `./build.sh` file.  This file creates a `./build` directory with the output files.  The default key chord for this in VSCODE is `ctrl+shift+b`.

Once the build directory is populated, simply open the `index.html` (generated during the build) in a local `file://...` URL in a browser.  Build again with changes, and `ctrl+F5` in the browser to see the results.

### Other platforms

Currently there's no other build processes for building on platforms outside of the Linux space.  But it would be trivial to do so.  The following steps need to happen for any build script:

* All `*.css` files need to be joined together into one file, in a specific order (right now just using the default NTFS sort order).  This needs to be done for the import step too.
* When testing locally, the `skilltree.html` needs to be wrapped in some basic `<html>` skeleton.

# Importing into Roll20
From the build directory you need the following files:

* `./build/skilltree.css` -- This file is imported into Roll20's CSS section.
* `./build/skilltree.html` -- This file is imported into Roll20's HTML section.

This repository doesn't provide `translations.json` file.  Roll20 considers that optional
The `./build/index.html` file is for testing locally.  It is not used for Roll20.  Roll20 will provide it's own wrapper file.