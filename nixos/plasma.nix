{config, pkgs, lib, ...}:
let
  plasmaOption = lib.mkEnableOption "plasma";
in
{
  options.plasma = {
    enable = plasmaOption;
  };

  config.services = lib.mkIf config.plasma.enable {
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm = {
        enable = true;
        theme = "breeze";
      };
      desktopManager.plasma6.enable = true;
      xserver.enable = false;
  };

  config.users.users.horvalds = lib.mkIf config.plasma.enable {
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  config.environment = lib.mkIf config.plasma.enable {
    systemPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xsettingsd
      xorg.xrdb
      kdePackages.bluez-qt
    ];
  };

  config.programs.firefox = lib.mkIf config.plasma.enable {
    nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
  };

  config.programs.chromium.enablePlasmaBrowserIntegration = config.plasma.enable;
}
