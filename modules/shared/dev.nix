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
    vim
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
    claude-code

    # Languages
    luarocks
    lua51Packages.lua
    cargo
    go
    gnumake
    gcc
    postgresql
  ];
}
