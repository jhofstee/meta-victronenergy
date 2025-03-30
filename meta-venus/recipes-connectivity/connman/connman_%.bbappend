FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DEPENDS += "readline"

INITSCRIPT_PARAMS = "start 70 5 2 3 4 . stop 22 0 1 6 ."

# do not adjust dirs, only import them
VELIB_DEFAULT_DIRS = "1"
inherit ve_package

# Always use the util-linux version, since it tries to write to
# /etc/adjtime which won't work with a read-only rootfs. The
# busybox version doesn't support --noadjfile though.
RDEPENDS:${PN} += "util-linux-hwclock"

SRC_URI += "\
    file://main.conf \
    file://connmand-watch.sh \
"

do_configure:append() {
    sed -i -e 's:\$(localstatedir)/lib:${permanentlocalstatedir}/lib:' ${B}/Makefile
}

do_install:append() {
    install -d ${D}${sysconfdir}/connman
    install -m 0644 ${UNPACKDIR}/main.conf ${D}${sysconfdir}/connman/main.conf
    install -m 0755 ${UNPACKDIR}/connmand-watch.sh ${D}${sbindir}/connmand-watch.sh
}
