help:
	@echo "Usage: make setup|install|link"

test-setup:
	@./test

install: vim-install

link: vim-link

setup: install link

vim-install:
	@./vim install

vim-link:
	@./vim link
