# build but not installed in the image
inherit packagegroup
LICENSE = "MIT"

DEPENDS += "\
	devmem2 \
	gdb \
	git \
	nodejs \
	packagegroup-core-buildessential \
	python-pylint \
	s6 \
	tcpdump \
	tinymembench \
	tmux \
	valgrind \
	vim \
"
