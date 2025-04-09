#!/bin/sh

. ./internal

install() {
  prints "Installing tmux..."
  install_package "tmux"
}

link() {
  prints "Linking tmux config..."
  ln -sf "$DIR"/config/tmux/.tmux.conf "$HOME"/.tmux.conf
}

main "$1"
