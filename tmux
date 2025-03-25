#!/bin/sh

. ./internal

install() {
  prints "Installing tmux..."
  is_debian && sudo apt install -y tmux
}

link() {
  prints "Linking tmux config..."
  ln -sf "$DIR"/config/tmux/.tmux.conf "$HOME"/.tmux.conf
}

main "$1"
