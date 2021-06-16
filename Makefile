all: setup

setup: install ~/.gitconfig ~/.tmux.conf ~/.config/nvim/init.vim ~/.zshrc ~/.ipython/profile_default/ipython_config.py

/usr/local/bin/brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/usr/local/bin/python3:
	brew install python

BREW_PACKAGES = \
	git \
	gh \
	git-secrets \
	peco \
	tmux \
	reattach-to-user-namespace \
	neovim \
	php \
	composer \
	terraform

PIP_PACKAGES = \
	pynvim \
	ipython

.PHONY: install
install: /usr/local/bin/brew /usr/local/bin/python3
	./bin/wbrew "$(BREW_PACKAGES)"
	/usr/local/bin/pip3 install $(PIP_PACKAGES)

~/.gitconfig:
	git config --global user.email 204491+FGtatsuro@users.noreply.github.com
	git config --global user.name FGtatsuro
	git secrets --register-aws --global
	git secrets --install ~/.git-templates/git-secrets
	git config --global init.templateDir ~/.git-templates/git-secrets

~/.tmux.conf:
	cp home/.tmux.conf ~/.tmux.conf

~/.config:
	mkdir -p ~/.config

~/.config/nvim/init.vim: ~/.config
	cp -R home/.config/nvim ~/.config/

~/.zshrc:
	chsh -s /bin/zsh
	cp home/.zshrc ~/.zshrc

~/.ipython/profile_default/ipython_config.py:
	mkdir -p ~/.ipython/profile_default
	cp home/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py
