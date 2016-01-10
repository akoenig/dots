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

### dots spotted in the wild

This is a list of `dots repositories` that have been spotted in the wild. [Let me know](https://github.com/akoenig/dots/issues/new), if you've seen one as well. I will add it here.

  * [akoenig/aliases.dots](https://github.com/akoenig/aliases.dots)

## Writing own `dots`

Having a dotfiles manager is a nice thing, but how to write own `dots repositories` this manager can consume? It's easy. Follow along.

First of all you have to setup a new git repository and create a file, called `dots.manifest`, in it. I know what you might think: "Wohaa! Yet another manifest definition!1one". No worries, this one is just a two-liner. An example:

```sh
name='the-name-of-your-dots-repo',
author='First name Last name <email-address>'
```

That's all, I promise.

The next step is to create an install script, called `install.sh`, and an uninstall script, the `uninstall.sh`. Those scripts will be executed by `dots` when installing/uninstalling your dots repository. Please make sure that you execute the steps which are necessary to perform the respective task.

### API

`dots` exposes an API which is available within your `install.sh` and `uninstall.sh`..

#### `$SELF`

An environment variable which contains the path to your `dots repository`. If you want to access files within your repository you would use this variable within you `install.sh` / `uninstall.sh` (e.g. `$SELF/a-file`)

#### `dots_profile_add`

Provides an interface for inserting instructions to your profile (e.g. `.zshrc`, `.bashrc`, etc.).

```sh
dots_profile_add "source $HOME/aliases"
```

Please note that there is no "remove" equivalent. You don't have to worry about removing the written statements. `dots` will do this for you in the `uninstall` step automatically.

**Important note:** Please make sure that you batch all your statements you want to write to the profile and call this function only once within your `install.sh`.

#### `dots_output_success`

Helper function for printing a `success` message to stdout.

#### `dots_output_finished`

Helper function for printing a `finished` message to stdout.

#### `dots_output_info`

Helper function for printing a `info` message to stdout.

#### `dots_output_warn`

Helper function for printing a `warn` message to stdout.

#### `dots_output_fail`

Helper function for printing a `fail` message to stdout.

## License

MIT © [André König](http://andrekoenig.info)
