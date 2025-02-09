{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # lua
    lua
    luaformatter
    lua-language-server

    # clang
    gcc14
    llvmPackages_19.clang-tools

    # go
    gopls

    # python
    python314
    python312Packages.python-lsp-server
    black
    isort

    # rust
    rustup
    cargo-toml-lint

    # yaml
    yamllint

    # Bash
    shellcheck
    bash-language-server

    # Nix
    alejandra
  ]; 
  
  programs.go = {
    enable = true;
    telemetry = {
      mode = "off";
    };
  };
}

# TODO: Add luals, gopls, clangd, pylsp
# TODO: Also add clang-format, gofmt, luaformatter
# TODO: Maybe others? Rust analyser, yaml, json, toml, bash, nix
