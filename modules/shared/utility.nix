{ pkgs, ... }:
{
  services.pgadmin = {
    enable = true;
    initialEmail = "pgadmin";
    initialPasswordFile = pkgs.writeText "pgadmin-password" "password";
  };

  services.postgresql.package = pkgs.postgresql_16;

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
