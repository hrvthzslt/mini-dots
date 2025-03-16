help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: vim-install tmux-install # Install all sotware

link: vim-link tmux-link # Link all config

setup: install link # Install all software and link all config

vim-install: # Install vim
	@./vim install

vim-link: # link vim config
	@./vim link

tmux-install: # Install tmux
	@./tmux install

tmux-link: # link tmux config
	@./tmux link

test-setup: # Setup test environment
	@./test
