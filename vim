#!/bin/sh

. ./internal

install() {
  prints "Installing vim..."
  install_package "vim"
}

link() {
  prints "Linking vim config..."
  ln -sf "$DIR"/config/vim/.vimrc "$HOME"/.vimrc
}

main "$1"
