LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
S = "${WORKDIR}"

inherit ve_package allarch

# FIXME
do_configure () {
    printf "${DISTRO_VERSION}\n${DISTRO_NAME}\n$20220216221103\n" > version
}

#do_configure[nostamp] = "1"
#do_configure[vardepsexclude] = "DATE TIME"

do_install () {
    install -d ${D}${vedir}
    install -m 644 version ${D}${vedir}
}

FILES:${PN} += "${vedir}"
