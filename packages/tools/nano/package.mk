# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nano"
PKG_VERSION="5.9"
PKG_SHA256="757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937"
PKG_LICENSE="GPL"
PKG_SITE="http://www.nano-editor.org/"
PKG_URL="http://ftpmirror.gnu.org/nano/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain ncurses"
PKG_LONGDESC="Nano is an enhanced clone of the Pico text editor."

PKG_CONFIGURE_OPTS_TARGET="--disable-utf8 \
                           --disable-nls \
                           --disable-libmagic \
                           --disable-wrapping"

post_makeinstall_target() {
  rm -rf ${INSTALL}/usr/share/nano

  mkdir -p ${INSTALL}/etc
  cp -a ${PKG_DIR}/config/* ${INSTALL}/etc/

  mkdir -p ${INSTALL}/usr/share/nano
  for FILE_TYPES in \
    css \
    html \
    java \
    javascript \
    json \
    php \
    python \
    sh \
    xml
  do
    cp -a ${PKG_BUILD}/syntax/${FILE_TYPES}.nanorc ${INSTALL}/usr/share/nano/
  done
}
