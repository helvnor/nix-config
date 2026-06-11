{ pkgs, inputs, ... }:
{
  nix.enable = false;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    trash-cli
    colima
    docker
    docker-compose
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  system.keyboard.enableKeyMapping = true;

  system.stateVersion = 5;
}
