help:
	@echo "Usage: make setup|install|link"

install: vim-install

link: vim-link

setup: install link

vim-install:
	@./blocks/vim/vim install

vim-link:
	@./blocks/vim/vim link
