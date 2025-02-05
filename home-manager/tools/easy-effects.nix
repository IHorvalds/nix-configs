{ ... }:
{
  xdg.enable = true;

  xdg.configFile.easyeffectsAutoloadOutput = {
    source = ./easy-effects-presets/autoload-output.json;
    target = "./easyeffects/autoload/output/alsa_output.pci-0000_00_1b.0.analog-stereo:analog-output-speaker.json";
  };

  xdg.configFile.easyeffectsMBPProfile = {
    source = ./easy-effects-presets/MBP-13-2015.json;
    target = "./easyeffects/output/MBP-13-2015.json";
  };
}
