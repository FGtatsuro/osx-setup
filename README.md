# osx-setup
Setup script for OSX

## Requirement

- GNU Make

## Setup

```bash
$ make

# For M1 Mac
$ make BREW_PREFIX=/opt/homebrew
```

## Manual setup

Authentication for several CLI tools

```bash
# Github
$ gh auth login

# AWS: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
$ aws configure
```

Several packages must be installed via cask

```bash
$ brew install --cask docker
$ open /Applications/Docker.app

$ brew install --cask licecap
```

Registration for Neovim plugins

```vim
$ nvim
:UpdateRemotePlugins
```

[Earthly](https://docs.earthly.dev)

```bash
$ earthly bootstrap
```
