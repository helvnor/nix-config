{ pkgs, ... }:
{

  # # greeted
  # programs.hyprland.enable = true;
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     initial_session = {
  #       command = "${pkgs.hyprland}/bin/start-hyprland";
  #       user = "norrman";
  #     };
  #     default_session = {
  #       command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --cmd ${pkgs.hyprland}/bin/start-hyprland";
  #       user = "greeter";
  #     };
  #   };
  # };
  #

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
