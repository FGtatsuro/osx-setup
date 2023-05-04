# osx-setup
Setup script for OSX

## Requirement

- GNU Make

## Setup

```bash
$ make brew-install # This Task is executed only once
$ make # Execute on New terminal

# For M1 Mac
$ make brew-install BREW_PREFIX=/opt/homebrew
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

[Flutter](https://docs.flutter.dev/get-started/install/macos)

```bash
$ sudo softwareupdate --install-rosetta --agree-to-license
```

Xcode

```bash
# Directory path is different depending on the version you install via xcodes.
$ sudo xcode-select --switch /Applications/Xcode-14.3.0.app/Contents/Developer
$ sudo xcodebuild -runFirstLaunch
$ sudo xcodebuild -license

# Open Xcode via Spotlight

$ open -a Simulator
```

Android

```bash
# Open Android Studio via Spotlight
# Install Android SDK and so on
```

## Other manual settings

Following manual settings are needed after script execution.

- Trackpad
   - 一本指でクリック
   - 三本指でドラッグ
- Keyboard
   - キーリピート速度(最速)
   - 修飾キーの変更(CapsLock->Ctrl)
   - 標準のファンクションキーの使用
- Desktop
   - ホットコーナー
   - Dock
- Terminal
   - プロファイル
      - Homebrew
   - テキスト
      - フォント(Ricty Diminished Discord Regular: 16)
   - ウインドウ
      - ウインドウサイズ(178 x 46)
   - シェル
      -シェルの終了時にウインドウを閉じる
   - キーボード
      - メタキーとしてOptionキーを使用
   - 詳細
      - オーディオベルの停止
