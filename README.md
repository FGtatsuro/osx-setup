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

[Awsume](https://awsu.me) and [Awsume Console Plugin](https://github.com/trek10inc/awsume-console-plugin)

```bash
$ awsume-configure
$ awsume --config set console.browser_command "\"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\" -incognito \"{url}\""
```

[Amazon ECR Docker Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper)

```bash
$ cat ~/.docker/config.json
{
...
        "credHelpers": {
                "xxxxxxxxxx.dkr.ecr.ap-northeast-1.amazonaws.com": "ecr-login",
                "public.ecr.aws": "ecr-login"
        },
...
}
```
