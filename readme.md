# dots

dotfile manager with support for multiple repositories

## Usage

`dot install <repo-0> <repo-1>`

This will install the given repositories. Please note that the last given repository will "win". Say that you have a `ssh` directory in both repositories, the one from `repo-1` will be used for installing.

Calling the command multiple times while there are already installed dotfiles, the previous installation will uninstalled first.

## [NOTES]

### `.dotsrc`

Will hold the current installed repositories.

### `.dots`

Will hold the flat directory tree of the given repositories.

