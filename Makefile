help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: install link # Install vim, tmux and link all config and scripts

install: vim-install tmux-install # Install vim and tmux without extra language tools

link: vim-link tmux-link scripts-link # Link all config

extra: extra-install # Install extra language tools for shell, python and c

MODULES := vim tmux scripts extra

%-install:
	@cd modules/$* && ./task install

%-link:
	@cd modules/$* && ./task link
