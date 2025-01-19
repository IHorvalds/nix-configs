# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  stdenv,
  lib,
  ...
}:
{
  imports =
    [
      ./hardware-configuration.nix
      
      ./bootloader.nix
      ./gnome.nix
      ./plasma.nix
      ./horvalds-home/horvalds-home.nix

      ./mbp-13-2015.nix
    ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Select One
  # Gnome
  gnome.enable = false;
  # Plasma
  plasma.enable = true;

  # Enable networking
  networking.networkmanager = {
    enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.horvalds = {
    isNormalUser = true;
    description = "Tudor Croitoru";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs.firefox = {
    enable = true;
    preferences = {
      "media.ffmpeg.vaapi.enabled" = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    vim
    stow
    vcpkg
    transmission_4-qt
    vlc
    protonvpn-gui
    nixd
    home-manager

    kmonad

    linuxKernel.packages.linux_zen.xpadneo
  ];

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    monaspace
  ];

  # Steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
  };

  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  # Git
  programs.git.enable = true;

  # AppImage
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Services
  services.flatpak.enable = true;

  # Disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
