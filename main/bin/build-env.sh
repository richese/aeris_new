#!/usr/bin/env bash

PATH="${MAIN_BIN_DIR}:${PATH}"

TMP_DIR="/tmp"

function install_ninja
{
  if [ ! -f "${MAIN_BIN_DIR}/ninja" ]; then
    echo "Installing build system: ninja-build"
    pushd "$TMP_DIR" > /dev/null
    git clone https://github.com/ninja-build/ninja.git
    pushd "ninja" > /dev/null
    ./configure.py --bootstrap
    if [ "$?" != "0" ]; then
      echo "Failed to install ninja-build."
      echo "See https://github.com/ninja-build/ninja for more information"
      exit 1
    fi
    popd > /dev/null
    popd > /dev/null

    cp "$TMP_DIR/ninja/ninja" "$MAIN_BIN_DIR"
    rm -rf "$TMP_DIR/ninja"
  fi
}


function install_meson
{
  if [ ! -f "${MAIN_BIN_DIR}/meson" ]; then
    echo "Installing build system: meson"
    pushd "$TMP_DIR" > /dev/null
    git clone https://github.com/mesonbuild/meson.git
    rm -v meson/__main__.py
    python3 -m zipapp -p '/usr/bin/env python3' -m meson:main -o "${MAIN_BIN_DIR}/meson" meson
    if [ "$?" != "0" ]; then
      echo "Failed to install meson-build."
      echo "See https://github.com/mesonbuild/meson for more information"
      exit 1
    fi
    popd > /dev/null
    rm -rf "$TMP_DIR/meson"
  fi
}


## Zaisti, že existuje adresár na kompiláciu projektu.
## $MAIN_BUILD_DIR je definovaný v bash-env.sh
if [ ! -d "$MAIN_BUILD_DIR" ]; then
  mkdir -v "$MAIN_BUILD_DIR"
fi

## Zaisti, že existuje adresár na kompiláciu projektu.
## $MAIN_BUILD_DIR je definovaný v bash-env.sh
if [ ! -d "$TMP_DIR" ]; then
  mkdir -v "$TMP_DIR"
fi

install_ninja
install_meson
