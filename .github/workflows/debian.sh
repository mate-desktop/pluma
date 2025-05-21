#!/usr/bin/bash

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages on Debian
requires=(
	ccache # Use ccache to speed up build
	meson  # Used for meson build
)

# https://salsa.debian.org/debian-mate-team/pluma
requires+=(
	autopoint
	autoconf-archive
	gobject-introspection
	gtk-doc-tools
	gettext
	gla11y
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
	mate-common
	yelp-tools
)

infobegin "Update system"
apt-get update -qq
infoend

infobegin "Install dependency packages"
env DEBIAN_FRONTEND=noninteractive \
	apt-get install --assume-yes \
	${requires[@]}
infoend
