{
  inputs,
  pkgs,
  lib,
  ...
}:
{

  # Network
  networking.hostName = "nixbook";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # time sync
  systemd.timers.ntp.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  programs.ssh.startAgent = true;

  # GTK support
  programs.dconf.enable = true;

  # Latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # System performance tweaks
  boot.kernel.sysctl."fs.inotify.max_user_instances" = lib.mkForce 1024000;
  boot.kernel.sysctl."fs.inotify.max_user_watches" = lib.mkForce 1024000;
  boot.kernel.sysctl."fs.aio-max-nr" = 1048576;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];

  # Wayland support for Electron / Chrome apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
  # Configure console keymap
  console = {
    keyMap = "us";
  };

  # Shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Privileges handler
  security.polkit.enable = true;

  # Dir env
  programs.direnv.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.x86_64-linux.default

    xdg-desktop-portal

    trashy
  ];

  system.stateVersion = "25.05";

}
