{ lib, noSysDirs, config, overlays, pkgs, ... }:

let
  yandex-browser = import ./yandex-browser/yandex-browser.nix { inherit pkgs; };
in

{
  yandex-browser = yandex-browser;
}
