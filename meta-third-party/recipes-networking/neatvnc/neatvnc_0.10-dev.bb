DESCRIPTION = "This is a liberally licensed VNC server library that's intended to be fast and neat."
LICENSE = "ISC"
LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"

DEPENDS += "aml gmp libdrm libjpeg-turbo nettle pixman"

inherit meson pkgconfig

SRC_URI = "git://github.com/any1/neatvnc;protocol=https;branch=master"

SRCREV = "4962e0af5d550b2c4fd34c79dbdca543f233d87c"

