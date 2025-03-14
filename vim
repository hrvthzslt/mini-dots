#!/bin/sh

. ./internal

install() {
  prints "Installing vim..."
  is_debian && sudo apt install -y vim
}

link() {
  prints "Linking vim config..."
  ln -sf "$DIR"/config/vim/.vimrc "$HOME"/.vimrc
}

main "$@"
