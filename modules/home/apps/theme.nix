{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    adwaita-icon-theme
  ];

  gtk = {
    enable = true;
    iconTheme.name = "Papirus-Dark";
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };
}

