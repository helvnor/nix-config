{ ... }:
{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services.power-profiles-daemon.enable = false;
  services.gnome.gcr-ssh-agent.enable = false;
}
