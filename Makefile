BREW_PREFIX := /usr/local

all: setup

setup: install ~/.gitconfig ~/.tmux.conf ~/.config/nvim/init.vim ~/.config/git/ignore ~/.config/karabiner/assets/complex_modifications/ctrl_m.json ~/.zshrc ~/.ipython/profile_default/ipython_config.py

diff:
	diff home/.zprofile ~/.zprofile -I "brew shellenv"
	diff home/.zshrc ~/.zshrc
	diff home/.tmux.conf ~/.tmux.conf
	diff -r home/.config/nvim ~/.config/nvim -x .netrwhist -x __pycache__
	diff -r home/.config/karabiner/assets/complex_modifications ~/.config/karabiner/assets/complex_modifications
	diff home/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py

.PHONY: brew-install
brew-install:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	cp home/.zprofile ~/.zprofile

$(BREW_PREFIX)/bin/python3:
	brew install python
	brew install pipx

BREW_PACKAGES = \
	git \
	gh \
	git-secrets \
	peco \
	earthly/earthly/earthly \
	parallel \
	autossh \
	tmux \
	colordiff \
	reattach-to-user-namespace \
	tree \
	aquaskk \
	karabiner-elements \
	font-ricty-diminished \
	neovim \
	visual-studio-code \
	awscli \
	aws-vault \
	session-manager-plugin \
	google-cloud-sdk \
	php \
	composer \
	go \
	gotags \
	delve \
	node \
	serverless \
	jq \
	postman \
	mysql \
	mysqlworkbench \
	authy \
	discord \
	zoom \
	imagemagick \
	tunnelblick \
	aws-sso-util \
	docker-credential-helper-ecr \
	krew \
	kind \
	tektoncd-cli \
	asdf \
	google-chrome \
	vivaldi \
	xcodes \
	cocoapods \
	android-studio \
	shellcheck \
	shfmt \
	yamlfmt \
	lefthook \
	watch \
	kube-ps1 \
	google-drive \
	slack \
	daisydisk

PIP_PACKAGES = \
	pandas \
	requests

PIP_CLI_PACKAGES = \
	ipython \
	notebook \
	sqlfluff \
	awsume

NPM_PACKAGES = \
	ts-node

GCLOUD_COMPONENTS = \
	gke-gcloud-auth-plugin

KUBECTL_PLUGINS = \
	stern \
	view-allocations \
	open-svc \
	ctx \
	ns

ASDF_PLUGINS = \
	terraform \
	kustomize \
	golang \
	ruby \
	flutter \
	kubectl \
	skaffold

# NOTE: asdf CLI limitationNOTE
# - asdf returns non-zero exit code when it tries to install already installed ones.
# - 'asdf plugin add' doesn't support multiple plugins like 'asdf plugin add p1 p2'.
.PHONY: install
install: $(BREW_PREFIX)/bin/python3
	./bin/wbrew "$(BREW_PACKAGES)"
	$(BREW_PREFIX)/bin/pipx install $(PIP_CLI_PACKAGES)
	$(BREW_PREFIX)/bin/pipx inject awsume awsume-console-plugin
	$(BREW_PREFIX)/bin/pipx inject ipython $(PIP_PACKAGES)
	$(BREW_PREFIX)/bin/pipx inject notebook $(PIP_PACKAGES)
	$(BREW_PREFIX)/bin/npm install -g $(NPM_PACKAGES)
	$(BREW_PREFIX)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/gcloud components install --quiet $(GCLOUD_COMPONENTS)
	$(BREW_PREFIX)/bin/kubectl krew install $(KUBECTL_PLUGINS)
	for p in $(ASDF_PLUGINS); do $(BREW_PREFIX)/bin/asdf plugin add $$p || :; $(BREW_PREFIX)/bin/asdf install $$p latest && $(BREW_PREFIX)/bin/asdf set -u $$p latest; done
	xcodes install --latest

~/.gitconfig:
	git config --global user.email 204491+FGtatsuro@users.noreply.github.com
	git config --global user.name FGtatsuro
	git secrets --register-aws --global
	git secrets --install ~/.git-templates/git-secrets
	git config --global init.templateDir ~/.git-templates/git-secrets
	git config --global url.git@github.com:.insteadOf https://github.com/
	git submodule update --init --recursive

~/.tmux.conf:
	cp home/.tmux.conf ~/.tmux.conf

~/.config:
	mkdir -p ~/.config

~/.config/nvim/init.vim: ~/.config
	cp -R home/.config/nvim ~/.config/

~/.config/nvim/venv: ~/.config
	mkdir -p ~/.config/nvim/venv
	$(BREW_PREFIX)/bin/python3 -m venv ~/.config/nvim/venv
	source ~/.config/nvim/venv/bin/activate
	pip install pynvim
	deactivate

~/.config/git/ignore: ~/.config
	cp -R home/.config/git ~/.config/

~/.config/karabiner/assets/complex_modifications/ctrl_m.json: ~/.config
	cp -R home/.config/karabiner/assets/complex_modifications/* ~/.config/karabiner/assets/complex_modifications/

~/.zshrc:
	chsh -s /bin/zsh
	cp home/.zshrc ~/.zshrc

~/.ipython/profile_default/ipython_config.py:
	mkdir -p ~/.ipython/profile_default
	cp home/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/ipython_config.py
