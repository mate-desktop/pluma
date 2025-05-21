#!/usr/bin/bash

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages on Ubuntu
requires=(
	ccache # Use ccache to speed up build
	meson  # Used for meson build
)

# https://git.launchpad.net/ubuntu/+source/pluma/tree/debian/control
requires+=(
	autopoint
	autoconf-archive
	git
	gobject-introspection
	gtk-doc-tools
	iso-codes
	libenchant-2-dev
	libgirepository1.0-dev
	libglib2.0-dev
	libgtk-3-dev
	libgtksourceview-4-dev
	libpeas-dev
	libsm-dev
	libx11-dev
	libxml2-dev
	make
	mate-common
	python3-dev
	python3-lxml
	yelp-tools
)

infobegin "Update system"
apt-get update -y
infoend

infobegin "Install dependency packages"
env DEBIAN_FRONTEND=noninteractive \
	apt-get install --assume-yes \
	${requires[@]}
infoend
