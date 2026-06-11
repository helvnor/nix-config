{ config, pkgs, ... }:
{
  users.knownUsers = [ "norrman" ];

  users.users.norrman = {
    uid = 501;
    description = "norrman";
    home = "/Users/norrman";
    shell = pkgs.fish;
  };

  system.primaryUser = "norrman";

  age.identityPaths = [ "${config.users.users.norrman.home}/.ssh/nix" ];
}
