{ pkgs, ... }:
{
  services.pgadmin.enable = true;

  environment.systemPackages = with pkgs; [
    # Essential
    vim
    git
    bat
    wget
    unzip
    htop
    sqlite

    # Docker
    docker
    docker-compose
  ];
}
