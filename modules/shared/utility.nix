{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Essential
    vim
    git
    bat
    wget
    unzip
    htop
    sqlite
  ];
}
