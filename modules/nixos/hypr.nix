{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Hypr
    hyprlock
    hypridle
    hyprpaper

    # Tools 
    nwg-displays
    nautilus
  ];

  home.file.".config/hypr" = {
    source = builtins.path {
      name = "hypr_config";
      path = ./hypr;
    };
  };
}
