all: setup

setup: install ~/.gitconfig

PACKAGES = \
	 git \
	 gh \
	 git-secrets \
	 peco

install:
	for p in $(PACKAGES); do printf "$$p\n"; ./bin/wbrew $$p; done

~/.gitconfig:
	git config --global user.email 204491+FGtatsuro@users.noreply.github.com
	git config --global user.name FGtatsuro
	git secrets --register-aws --global
	git secrets --install ~/.git-templates/git-secrets
	git config --global init.templateDir ~/.git-templates/git-secrets
