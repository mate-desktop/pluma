#!/usr/bin/bash

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages on Archlinux
requires=(
	ccache # Use ccache to speed up build
	clang  # Build with clang on Archlinux
	meson  # Used for meson build
)

# https://gitlab.archlinux.org/archlinux/packaging/packages/pluma
requires+=(
	appstream-glib
	autoconf-archive
	clang
	dconf
	enchant
	file
	gcc
	git
	glib2-devel
	gobject-introspection
	gtksourceview4
	iso-codes
	itstool
	libpeas
	libsm
	libx11
	make
	mate-common
	python
	which
	yelp-tools
)

infobegin "Update system"
pacman --noconfirm -Syu
infoend

infobegin "Install dependency packages"
pacman --noconfirm -S ${requires[@]}
infoend
