{ pkgs, username, ... }:
{
  programs.hyprland.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.hyprland}/bin/start-hyprland";
        user = username;
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --cmd ${pkgs.hyprland}/bin/start-hyprland";
        user = "greeter";
      };
    };
  };
}
