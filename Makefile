all: setup

setup: install ~/.gitconfig ~/.tmux.conf

PACKAGES = \
	 git \
	 gh \
	 git-secrets \
	 peco \
	 tmux \
	 reattach-to-user-namespace

/usr/local/bin/brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: install
install: /usr/local/bin/brew
	for p in $(PACKAGES); do printf "$$p\n"; ./bin/wbrew $$p; done

~/.gitconfig:
	git config --global user.email 204491+FGtatsuro@users.noreply.github.com
	git config --global user.name FGtatsuro
	git secrets --register-aws --global
	git secrets --install ~/.git-templates/git-secrets
	git config --global init.templateDir ~/.git-templates/git-secrets

~/.tmux.conf:
	cp home/.tmux.conf ~/.tmux.conf
