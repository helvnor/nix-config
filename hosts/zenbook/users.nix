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

  age.identityPaths = [ "${config.users.users.norrman.home}/.ssh/zenbook" ];
}
