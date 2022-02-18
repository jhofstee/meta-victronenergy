inherit localsettings
inherit update-rc.d

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
# get_boot_type is MACHINE specific
PACKAGE_ARCH = "${MACHINE_ARCH}"

SRC_URI += "\
    file://get_boot_type.c \
    file://init \
    file://localsettings \
    file://store_watchdog_error.sh \
    file://services.sh \
    file://vrm-online.sh \
"

# FIXME: file://0001-Use-MemAvailable-instead-of-MemFree.patch
# FIXME: file://0002-add-test-prescaler-to-run-test-less-often.patch

INITSCRIPT_PACKAGES = "${PN}"
INITSCRIPT_NAME:${PN} = "watchdog"
INITSCRIPT_PARAMS:${PN} = "start 80 S . stop 00 0 1 6 ."

do_compile:append () {
    ${CC} ${CFLAGS} ${LDFLAGS} -DMACH_${MACHINE} \
        ${WORKDIR}/get_boot_type.c -o get_boot_type
}

do_install:append () {
    install -d ${D}${sysconfdir}/init.d ${D}${sbindir}
    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/watchdog
    install -m 0755 ${B}/get_boot_type ${D}${sbindir}
    install -m 0755 ${WORKDIR}/store_watchdog_error.sh ${D}${sbindir}

    install -d ${D}${sysconfdir}/watchdog.d
    install -m 0755 ${WORKDIR}/services.sh ${D}/${sysconfdir}/watchdog.d
    install -m 0755 ${WORKDIR}/vrm-online.sh ${D}/${sysconfdir}/watchdog.d
}

