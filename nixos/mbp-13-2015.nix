{ config, pkgs, ... }:
{
  networking.hostName = "cheesecake";

  # The WiFi Card prevents sleeping and can't connect to anything after wakeup from sleep
  # without disabling random MAC addresses
  networking.networkmanager.wifi = {
    scanRandMacAddress = false;
    powersave = false;
    macAddress = "stable";
  };

  # Keyboard
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "mac";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Specific packages for this machine
  environment.systemPackages = with pkgs; [
    linuxKernel.packages.linux_zen.broadcom_sta
    intel-media-driver
    easyeffects
  ];

  # Webcam driver
  hardware.facetimehd.enable = true;
}
