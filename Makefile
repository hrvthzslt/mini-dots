help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: install link # Install all software and link all config

install: vim-install tmux-install tools-install # Install all sotware

link: vim-link tmux-link scripts-link # Link all config

vim-install: # Install vim
	@./vim install

vim-link: # Link vim config
	@./vim link

tmux-install: # Install tmux
	@./tmux install

tmux-link: # Link tmux config
	@./tmux link

scripts-link: # Link scripts
	@./scripts link

tools-install: # Install tools: ctags, man, shellcheck, shfmt
	@./tools install
