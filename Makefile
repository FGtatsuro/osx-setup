BREW_PREFIX := /usr/local

all: setup

setup: install ~/.gitconfig ~/.tmux.conf ~/.config/nvim/init.vim ~/.config/karabiner/assets/complex_modifications/ctrl_m.json ~/.zshrc ~/.ipython/profile_default/ipython_config.py

diff:
	diff home/.zprofile ~/.zprofile -I "brew shellenv"
	diff home/.zshrc ~/.zshrc
	diff home/.tmux.conf ~/.tmux.conf
	diff -r home/.config/nvim ~/.config/nvim -x .netrwhist -x __pycache__
	diff -r home/.config/karabiner/assets/complex_modifications ~/.config/karabiner/assets/complex_modifications
	diff home/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py

$(BREW_PREFIX)/bin/brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	cp home/.zprofile ~/.zprofile
	source ~/.zprofile
	brew tap homebrew/cask-fonts

$(BREW_PREFIX)/bin/python3:
	brew install python

BREW_PACKAGES = \
	git \
	gh \
	git-secrets \
	peco \
	parallel \
	autossh \
	tmux \
	reattach-to-user-namespace \
	tree \
	aquaskk \
	karabiner-elements \
	font-ricty-diminished \
	neovim \
	visual-studio-code \
	tfenv \
	awscli \
	aws-vault \
	session-manager-plugin \
	google-cloud-sdk \
	php \
	composer \
	go \
	goenv \
	gotags \
	node \
	serverless \
	jq \
	postman \
	mysql \
	mysqlworkbench \
	authy \
	discord \
	imagemagick \
	skitch \
	tunnelblick

PIP_PACKAGES = \
	pynvim \
	ipython \
	notebook \
	sqlfluff

NPM_PACKAGES = \
	ts-node

.PHONY: install
install: $(BREW_PREFIX)/bin/brew $(BREW_PREFIX)/bin/python3
	./bin/wbrew "$(BREW_PACKAGES)"
	$(BREW_PREFIX)/bin/pip3 install $(PIP_PACKAGES)
	$(BREW_PREFIX)/bin/npm install -g ts-node
	if [ ! -e "$(BREW_PREFIX)/bin/terraform" ]; then \
		tfenv install latest; \
		tfenv use latest; \
	fi

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

~/.config/karabiner/assets/complex_modifications/ctrl_m.json: ~/.config
	cp -R home/.config/karabiner/assets/complex_modifications/* ~/.config/karabiner/assets/complex_modifications/

~/.zshrc:
	chsh -s /bin/zsh
	cp home/.zshrc ~/.zshrc

~/.ipython/profile_default/ipython_config.py:
	mkdir -p ~/.ipython/profile_default
	cp home/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py
