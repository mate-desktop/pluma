#!/usr/bin/bash

# Use grouped output messages
infobegin() {
	echo "::group::${1}"
}
infoend() {
	echo "::endgroup::"
}

# Required packages on Fedora
requires=(
	ccache # Use ccache to speed up build
	meson  # Used for meson build
)

# https://src.fedoraproject.org/cgit/rpms/pluma.git
requires+=(
	desktop-file-utils
	enchant-devel
	gtk3-devel
	gtksourceview4-devel
	iso-codes-devel
	libSM-devel
	libpeas1-devel
	make
	mate-common
	mate-desktop-devel
	python3-devel
	python3-gobject-base
	python3-setuptools
)

infobegin "Update system"
dnf update -y
infoend

infobegin "Install dependency packages"
dnf install -y ${requires[@]}
infoend
