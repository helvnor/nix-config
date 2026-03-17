{ pkgs, ... }:
{
  home.packages = with pkgs; [

    # Terminal
    ghostty

    # Fonts
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono

    # Screenshot
    slurp
    grim
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

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
