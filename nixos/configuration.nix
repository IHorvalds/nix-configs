# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, stdenv, lib, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./gnome.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
  };

  # Gnome
  gnome.enable = true;

  networking.hostName = "cheesecake"; # Define your hostname.
  #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #  networking.wireless.networks = import ./wifi_networks.nix;

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "mac";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
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
    packages = [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    vim
    stow
    vcpkg
    transmission_4
    vlc
    protonvpn-gui

    linuxKernel.packages.linux_zen.xpadneo
    linuxKernel.packages.linux_zen.broadcom_sta
    easyeffects

    # gnomeExtensions.wireguard-vpn-extension
    # gnomeExtensions.weather-or-not
    # gnomeExtensions.paperwm
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Git
  programs.git.enable = true;

  # BASH
  programs.bash = {
    promptInit = ''
function get_git_branch() {
  if [[ ! -z $(git branch --show-current 2> /dev/null) ]]; then
    echo "{ git: $(git branch --show-current 2> /dev/null) }"
  fi
  echo ""
}

PROMPT_COMMAND='PS1_CMD1=$(get_git_branch)'
'' +
"PS1='\\[\\e[38;5;220m\\]\\u\\[\\e[37m\\]@\\[\\e[38;5;208m\\]\\h\\[\\e[0m\\] \\[\\e[37;3m\\]\\W\\[\\e[0m\\]\\[\\e[38;5;45m\\] \${PS1_CMD1}\\[\\e[0m\\]\n\$ '";
  };

  # AppImage
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Services
  services.flatpak.enable = true;
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}