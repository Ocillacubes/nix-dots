# NixOS config

{ config, pkgs, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  # Network
  networking.useDHCP = false; # Global flag bad
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;
  networking.networkmanager.enable = true;
  networking.hostName = "ganbaranai";

  # Users
  users.users.sasami-san = {
    isNormalUser = true;
    home = "/home/sasami-san";
    description = "Sasami Tsukuyomi";
    extraGroups = [ "wheel" ];
  };
  users.defaultUserShell = pkgs.zsh;

  # Mpd
  services.mpd.enable = true;

  # Xorg
  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.unclutter.enable = true; # hides cursor when not in use
  services.xserver.displayManager.lightdm.enable = true;
  
  # Audio
  sound.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # Urxvt
  services.urxvtd.enable = true;

  # Zsh
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    neovim
    qutebrowser
    git
    ranger
    pcmanfm
    keepassxc
    htop
    neovim
    feh
    jellyfin-media-player
    mpv
    newsboat
    remmina
    ncmpcpp
    pulsemixer
    claws-mail
    cifs-utils
    arandr
    exa
    dunst
    dmenu
    gimp
    krita
    lynx
    w3m
    p7zip
    neofetch
    xterm
    iosevka
    hanazono
    cmake
    tree
    lxappearance
  ];

}
