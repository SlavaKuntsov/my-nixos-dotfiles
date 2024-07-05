{ pkgs ? import <nixpkgs> {} }:

let
  fetchurl = pkgs.fetchurl;
  stdenv = pkgs.stdenv;
  lib = pkgs.lib;
  autoPatchelfHook = pkgs.autoPatchelfHook;
  wrapGAppsHook = pkgs.wrapGAppsHook;
  flac = pkgs.flac;
  gnome2 = pkgs.gnome2;
  harfbuzzFull = pkgs.harfbuzzFull;
  nss = pkgs.nss;
  snappy = pkgs.snappy;
  xdg-utils = pkgs.xdg-utils;
  xorg = pkgs.xorg;
  alsa-lib = pkgs.alsaLib;
  atk = pkgs.atk;
  cairo = pkgs.cairo;
  cups = pkgs.cups;
  curl = pkgs.curl;
  dbus = pkgs.dbus;
  expat = pkgs.expat;
  fontconfig = pkgs.fontconfig;
  freetype = pkgs.freetype;
  gdk-pixbuf = pkgs.gdk-pixbuf;
  glib = pkgs.glib;
  gtk3 = pkgs.gtk3;
  libX11 = pkgs.libX11;
  libxcb = pkgs.libxcb;
  libXScrnSaver = pkgs.libXScrnSaver;
  libXcomposite = pkgs.libXcomposite;
  libXcursor = pkgs.libXcursor;
  libXdamage = pkgs.libXdamage;
  libXext = pkgs.libXext;
  libXfixes = pkgs.libXfixes;
  libXi = pkgs.libXi;
  libXrandr = pkgs.libXrandr;
  libXrender = pkgs.libXrender;
  libXtst = pkgs.libXtst;
  libdrm = pkgs.libdrm;
  libnotify = pkgs.libnotify;
  libopus = pkgs.libopus;
  libpulseaudio = pkgs.libpulseaudio;
  libuuid = pkgs.libuuid;
  libxshmfence = pkgs.libxshmfence;
  mesa = pkgs.mesa;
  nspr = pkgs.nspr;
  pango = pkgs.pango;
  systemd = pkgs.systemd;
  at-spi2-atk = pkgs.at-spi2-atk;
  at-spi2-core = pkgs.at-spi2-core;
in


stdenv.mkDerivation rec {
  pname = "yandex-browser";
  version = "21.5.3.753-1";

  src = fetchurl {
    url = "http://repo.yandex.ru/yandex-browser/deb/pool/main/y/${pname}-beta/${pname}-beta_${version}_amd64.deb";
    sha256 = "sha256-sI2p/fCaruUJ3qPMyy+12Bh5I1SH8m7sYX5yDex2rwg=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook
  ];

  buildInputs = [
    flac
    harfbuzzFull
    nss
    snappy
    xdg-utils
    xorg.libxkbfile
    alsa-lib
    at-spi2-atk
    at-spi2-core
    atk
    cairo
    cups
    curl
    dbus
    expat
    fontconfig.lib
    freetype
    gdk-pixbuf
    glib
    gnome2.GConf
    gtk3
    libX11
    libXScrnSaver
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrandr
    libXrender
    libXtst
    libdrm
    libnotify
    libopus
    libuuid
    libxcb
    libxshmfence
    mesa
    nspr
    nss
    pango
    stdenv.cc.cc.lib
  ];

  unpackPhase = ''
    mkdir -p $TMP/ya $out/bin
    cp $src $TMP/ya.deb
    ar vx $TMP/ya.deb
    tar --no-overwrite-dir -xvf data.tar.xz -C $TMP/ya/
  '';

  installPhase = ''
    cp -R $TMP/ya/opt $out/
    ln -sf $out/opt/yandex/browser-beta/yandex_browser $out/bin/yandex-browser
  '';

  runtimeDependencies = [
    libpulseaudio.out
    (lib.getLib systemd)
  ];

  meta = with lib; {
    description = "Yandex Web Browser";
    homepage = "https://browser.yandex.ru/";
    license = licenses.unfree;
    maintainers = with maintainers; [ dan4ik605743 ];
    platforms = [ "x86_64-linux" ];
  };
}
