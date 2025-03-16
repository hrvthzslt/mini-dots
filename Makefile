help:
	@echo "Usage: make setup|install|link"

test-setup:
	@./test

install: vim-install tmux-install

link: vim-link tmux-link

setup: install link

vim-install:
	@./vim install

vim-link:
	@./vim link

tmux-install:
	@./tmux install

tmux-link:
	@./tmux link
