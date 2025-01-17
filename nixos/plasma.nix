{config, pkgs, lib, ...}:
let
  plasmaOption = lib.mkEnableOption "plasma";
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./sddm-tokyo-night-theme.nix { };
in
{
  options.plasma = {
    enable = plasmaOption;
  };

  config.services = lib.mkIf config.plasma.enable {
      # Enable the KDE Plasma Desktop Environment.
      displayManager.sddm.enable = true;
      desktopManager.plasma6.enable = true;
      displayManager.sddm.theme = "tokyo-night-sddm";
      xserver.enable = false;
  };

  config.users.users.horvalds = lib.mkIf config.plasma.enable {
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  config.environment = lib.mkIf config.plasma.enable {
    systemPackages = with pkgs; [ tokyo-night-sddm ];
  };


}
