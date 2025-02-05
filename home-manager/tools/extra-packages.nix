{ pkgs, ...}:

{
  home.packages = with pkgs; [
    cheese
    whatsapp-for-linux
    discord

    gcc14
    llvmPackages_19.clang-tools

    wezterm
  ];
}
