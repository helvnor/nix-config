{ pkgs, config, ... }:
{

  # Docker config
  environment.sessionVariables = {
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
  };

  virtualisation.docker = {
    enable = true;
  };

  networking.firewall = {
    enable = false;
    trustedInterfaces = [ "docker0" ];
    checkReversePath = false;
  };

  age.secrets.wireguard = {
    file = ../../secrets/wireguard.age;
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = config.age.secrets.wireguard.path;
    };
  };

  environment.systemPackages = with pkgs; [

    # IDE
    jetbrains.idea

    # Utility
    bitwarden-cli
    obsidian
    vivaldi
    onlyoffice-desktopeditors
    gparted
    altair

    # Docker & K8s
    stern
    kubectx
    kubectl
    kubectl-cnpg
    docker-buildx

    # Google Cloud
    (pkgs.google-cloud-sdk.withExtraComponents [
      pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])

  ];
}
