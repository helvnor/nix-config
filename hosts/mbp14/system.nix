{ pkgs, inputs, ... }:
{
  nix.enable = false;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    trash-cli
    colima
    inputs.agenix.packages.aarch64-darwin.default
  ];

  system.keyboard.enableKeyMapping = true;

  system.stateVersion = 5;
}
