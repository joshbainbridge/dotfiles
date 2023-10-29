#!/usr/bin/env bash

LINKS=(
	".config/git git-config"
	".config/helix helix-config"
	".config/alacritty alacritty-config"
	".config/tmux tmux-config"
)

MACOS_LINKS=(
	".hushlogin hush-login"
	".zshrc zshrc-config"
	".ssh/config ssh-config"
)

if [ ! -z "$1" ] && [ "$1" = "macos" ]; then
	LINKS=("${LINKS[@]}" "${MACOS_LINKS[@]}")
fi

error() {
	echo "Error: $1 already exists; please remove and run again" >&2
	exit 2
}

for ELEMENT in "${LINKS[@]}"; do
	PAIR=( $ELEMENT );
	[ -e "${HOME}/${PAIR[0]}" ] && error "~/${PAIR[0]}"
done

for ELEMENT in "${LINKS[@]}"; do
	PAIR=( $ELEMENT );
	ln -s "${PWD}/${PAIR[1]}" "${HOME}/${PAIR[0]}"
done
