{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dope-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 75;
  };

  users.users.chris = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tlp.enable = true;
  hardware.graphics.enable = true;
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    foot
    swaybg
    btop
    htop
    yazi
    swaynotificationcenter
    fastfetch
    pulseaudio
    pavucontrol
    libnotify
    waybar
    libva-utils
    fuzzel
    swaylock
    mpv
    brightnessctl
    papirus-icon-theme
    xwayland-satellite
    ffmpegthumbnailer
    swayidle
    pkgs.nautilus
    loupe
    evince
    ddcutil
    playerctl
    brave
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ubuntu-sans
  ];

  fonts.fontconfig.defaultFonts = {
    serif = [ "Ubuntu Sans" ];
    sansSerif = [ "Ubuntu Sans" ];
    monospace = [ "JetBrainsMono Nerd Font" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}

