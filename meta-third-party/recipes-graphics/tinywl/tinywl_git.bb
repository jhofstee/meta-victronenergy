DESCRIPTION = "This is the "minimum viable product" Wayland compositor based on wlroots."
LICENSE = "CC0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=d957da0415f5b0b974bfc6063afab2b5"

DEPENDS += "wlroots wayland-native wayland-protocols"

inherit pkgconfig

SRC_URI = "git://github.com/swaywm/wlroots;protocol=https"
SRCREV = "8ad2cc39eb420c22dde7e49c01bde916b7bc58cc"
S = "${WORKDIR}/git/tinywl"

