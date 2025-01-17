{ config, pkgs, lib, ...}:
let
  gnomeOption = lib.mkEnableOption "gnome";
in
{
  options.gnome = {
    enable = gnomeOption;
  };
  # Enable the GNOME Desktop Environment.
  config.services = lib.mkIf config.gnome.enable {
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
  };

  config = {
    environment = lib.mkIf config.gnome.enable {
      gnome.excludePackages = with pkgs; [
	gnome-backgrounds
	gnome-browser-connector
	gnome-contacts
	gnome-maps
	gnome-music
	gnome-online-accounts
	gnome-remote-desktop
	epiphany
	yelp
      ];
      systemPackages = with pkgs; [
        gnomeExtensions.wireguard-vpn-extension
        gnomeExtensions.weather-or-not
        gnomeExtensions.paperwm
      ];
    };
  };
}
