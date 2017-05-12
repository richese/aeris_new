#!/usr/bin/env bash

PATH="${MAIN_BIN_DIR}:${PATH}"

TMP_DIR="/tmp"

function install_ninja
{
  if [ ! -f "${MAIN_BIN_DIR}/ninja" ]; then
    # Použi systémovú inštaláciu ak je dostupná
    NINJA_CMD="$(command -v ninja)"
    if [ -n "$NINJA_CMD" ]; then
      NINJA_VERSION="$($NINJA_CMD --version)"
      if [ "$(printf "1.5\n$NINJA_VERSION" | sort -V | tail -n 1 )" == "$NINJA_VERSION" ]; then
        ln -s "$NINJA_CMD" "$MAIN_BIN_DIR/ninja"
        echo "Using system installation for ninja: $NINJA_CMD"
        return
      fi
    fi

    # inak skompiluj z gitu
    echo "Locally installing build system: ninja-build"
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
    # Použi systémovú inštaláciu ak je dostupná
    MESON_CMD="$(command -v meson)"
    if [ -n "$MESON_CMD" ]; then
      MESON_VERSION="$MESON_CMD --version"
      if [ "$(printf "0.38.0\n$MESON_VERSION" | sort -V | tail -n 1)" == "$MESON_VERSION" ]; then
        ln -s "$MESON_CMD" "$MAIN_BIN_DIR/meson"
        echo "Using system installation for meson: $MESON_CMD"
        return
      fi
    fi

    echo "Locally installing build system: meson"
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

install_ninja
install_meson
