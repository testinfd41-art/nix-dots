{ config, lib, pkgs, ... }:

{
  imports = [
    ./apps/firefox.nix
    ./apps/spotify.nix
    ./apps/chromium.nix
    ./apps/theme.nix
  ];
}
