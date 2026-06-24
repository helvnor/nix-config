{ pkgs, inputs, ... }:
{
  home.file.".config/ghostty".source = inputs.dotfiles + "/ghostty";
  home.file.".vimrc".source = inputs.dotfiles + "/vim/dot_vimrc";
  home.file.".tmux.conf".source = inputs.dotfiles + "/tmux/dot_tmux.conf";
  home.file.".config/fish" = {
    source = inputs.dotfiles + "/fish";
    recursive = true;
  };

  home.packages = with pkgs; [

    # Tools
    tmux
    fzf
    ripgrep
    fd
    age
    delta
    jq
    tree-sitter
    trivy
    sops
    nodejs
    pnpm
    duckdb
    inputs.llm-agents.packages.${pkgs.system}.claude-code
    inputs.llm-agents.packages.${pkgs.system}.antigravity-cli
    fluxcd

    # Languages
    luarocks
    lua51Packages.lua
    cargo
    rustc
    gnumake
    gcc
    postgresql
    python3
    go

    # (pkgs.go_1_26.overrideAttrs (
    #   oldAttrs: finalAttrs: rec {
    #     version = "1.26.0";
    #     src = pkgs.fetchurl {
    #       url = "https://go.dev/dl/go${version}.src.tar.gz";
    #       hash = "sha256-yRMqih9r0qpKrR10uCMdlSdJUEg6SVBlfubFbm6Bd5A=";
    #     };
    #   }
    # ))

  ];
}
