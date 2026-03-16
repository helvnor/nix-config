{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprlock
    hypridle
    hyprpaper
  ];

  home.file.".config/hypr" = {
    source = builtins.path {
      name = "hypr_config";
      path = ./hypr;
    };
  };
}
