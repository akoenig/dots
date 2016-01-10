# dots

Modular dotfiles manager

## Motivation

We all love [dotfiles](https://dotfiles.github.io), don't we? There are excellent collections of dotfiles from people who are courageously publishing those online. That's awesome! Despite all the awesomeness, there is one thing that bothers me: the monolithic nature of a repository that contains all the dotfiles at once. Personally, I'm facing the situation quite often where I want to grab one configuration but not everything. There are also situations where I have dotfiles which should not be publicly available, like my `ssh config` which I use at work. Is there any solution for this? Sure, you could maintain multiple dotfiles repos (personal, work, server, etc.). But let's face it. This would result in a lot of duplicate configuration files. Meh.

Wouldn't it be cool to pick only the dotfiles I really want? That is where `dots` comes to play. It encourages you to separate your dotfiles into small, encapsulated repositories. `dots` provides a management CLI with which you can install, update and uninstall your personal dotfile collection. With other words: `dots` is a dotfiles structure philosophy and a tool at once.  

## Installation

Convinced to give `dots` a try? The installation is as easy as managing your personal dotfile collection. There are two ways for installing `dots`:

### Via install script

To install or update `dots`, you can use the [install script](https://github.com/akoenig/dots/blob/master/install.sh) using cURL:

```sh
curl -o- https://raw.githubusercontent.com/akoenig/dots/master/install.sh | bash
```

This script will install `dots` in `$HOME/.dots` and adds the source line to your profile. Restart your shell session in order to finalize the installation.

### Manual install

There is also a manual way of installing `dots`. Create a directory somewhere in your filesystem and `cd` into it. Then clone this repository:

```sh
git clone https://github.com/akoenig/dots .
```

Now add the following line to your profile (e.g. `.zshrc`, `.bashrc`, etc.):

```sh
source <the-path-to-your-installation>/dots
```

Restart your shell session in order to finalize the installation.

## Usage

```sh
dots help

  dots - Your dotfiles manager

  Usage: dots [COMMAND] [OPTION]

  Available commands:

  install <repository>  Installs the given dots
  update <dots>         Updates the given dots repository
  uninstall <dots>      Uninstalls the given dots repository
  ls					Lists all installed dots repositories
  help                  Prints this help
```

### `install <repository>`

Install the given `dots repository` to your personal dotfile collection. An example:

```sh
dots install git@github.com:akoenig/aliases.dots
```

This will install my personal aliases.

### `update <dots>`

Sync a respective local `dots repository` with the remote one.

```sh
dots update aliases
```

This would update the `aliases` shown in the example before..

### `uninstall <dots>`

Uninstalls a local `dots repository`.

```sh
dots uninstall aliases
```

This would uninstall the dots repository with the name `aliases`.

### `ls` or `list`

Lists all currently installed dots repositories.

## Writing own `dots`

## License

MIT © [André König](http://andrekoenig.info)
