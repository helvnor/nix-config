{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      # Terminal
      "ghostty"

      # Dev
      "orbstack"

      # Social
      "messenger"
      "discord"

      # Game
      "jagex"
      "runelite"
      "battle-net"
      "curseforge"
      "steam"
      "anki"

      # Browser
      "google-chrome"
    ];
    onActivation.autoUpdate = true;
    onActivation.cleanup = "uninstall";
    onActivation.upgrade = true;
  };
}
