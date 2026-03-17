{ config, ... }:
{
  users.users.norrman = {
    isNormalUser = true;
    description = "norrman";
    home = "/home/norrman";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
  };

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  age.identityPaths = [ "${config.users.users.norrman.home}/.ssh/zenbook" ];
}
