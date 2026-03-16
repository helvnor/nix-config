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

  # Dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.file.".config/hypr" = {
    source = builtins.path {
      name = "hypr_config";
      path = ./hypr;
    };
  };
}
