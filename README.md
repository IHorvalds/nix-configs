## Config files for my machines running various *nixes.

These won't be the nicest configs, but they work for me and will improve over time.<br>
Hopefully.

## NixOS notes

The configuration for the OS is in the nixos/ folder.
It's quite specific to the Apple MBP 13" 2015 with a Broadcom 43xx WiFi card (specific configs for allowing it to sleep and wake up from sleep consistently).

Includes the home-manager module, but does *NOT* install the home-manager configuration. This is to keep the OS config separate from the user home configs.

### Installation

- With a NixOS ISO burned onto a USB stick, make 2 partitions using something like GParted.
  Only needs root (/) and boot (/boot).
- Make note of the partition device names (e.g. /dev/sda1)
- `sudo mount /dev/sda1 /mnt # the root partition`
- `sudo mount /dev/sda2 /mnt/boot # the /boot partition`
- Run `sudo nixos-generate-config --root /mnt`. Only need the `hardware-config.nix`
- Copy the `nixos` folder from this repo onto /mnt/etc/nixos, leaving `hardware-config.nix`
- Run `sudo nixos-install /mnt`
- Set a root password when prompted

## Home-Manager notes

***Should*** work on any linux with the nix package manager installed.
On non-NixOS, add 
```nix
  nixGL.packages = import <nixgl> { inherit pkgs; };
```
to `home.nix` to allow using the GPU accelerated versions of packages.

### Installation

- Move (or stow) the `home-manager` to .config/
- Run `home-manager switch`
