{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # Screen brightness control
    brightnessctl

    # Audio control
    pamixer

    # Laptop power managerment
    upower

    # Temperature monitoring
    lm_sensors
  ];

  # Intel graphics
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Hardware acceleration
      intel-media-driver

      # OpenCL support
      intel-compute-runtime
    ];
  };

  # Touchpad support
  services.libinput.enable = true;

  # ZRAM configuration
  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Power management and thermals
  services.auto-cpufreq.enable = true;
  services.thermald.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
