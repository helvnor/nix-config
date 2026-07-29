{ pkgs, ... }:
{
  home.packages = with pkgs; [

    # Terminal
    ghostty

    # Fonts / Icons
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    papirus-icon-theme

    # Screenshot
    slurp
    grim

    playerctl
  ];

  # Cursor theme
  home.pointerCursor = {
    enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
    gtk.enable = true;
  };

  # Dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.sessionVariables = {
    QS_ICON_THEME = "Papirus-Dark";
  };

  gtk = {
    enable = true;
    gtk4.theme = null;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
