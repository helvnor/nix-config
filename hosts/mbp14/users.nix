{ config, ... }:
{
  users.users.norrman = {
    description = "norrman";
    home = "/Users/norrman";
  };

  system.primaryUser = "norrman";

  age.identityPaths = [ "${config.users.users.norrman.home}/.ssh/nix" ];
}
