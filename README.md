# osx-setup
Setup script for OSX

## Requirement

- GNU Make

## Setup

```bash
$ make
```

## Manual setup

Authentication for several CLI tools

```bash
# Github
$ gh auth login

# AWS: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html
$ aws configure
```

Registration for Neovim plugins

```vim
$ nvim
:UpdateRemotePlugins
```
