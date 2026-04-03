{ config, pkgs, ... }:
{
  users.users.norrman = {
    description = "norrman";
    home = "/Users/norrman";
    shell = pkgs.fish;
  };

  system.primaryUser = "norrman";

  age.identityPaths = [ "${config.users.users.norrman.home}/.ssh/nix" ];
}
