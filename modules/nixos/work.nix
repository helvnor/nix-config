{ pkgs, config, ... }:
{

  environment.sessionVariables = {
    COMPOSE_DOCKER_CLI_BUILD = "1";
    DOCKER_BUILDKIT = "1";
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  virtualisation.docker = {
    enable = true;
  };

  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "docker0" ];
    checkReversePath = "loose";
  };

  age.secrets.wireguard = {
    file = ../../secrets/wireguard.age;
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = config.age.secrets.wireguard.path;
    };
  };

  age.secrets.pgadmin = {
    file = ../../secrets/pgadmin.age;
  };

  services.pgadmin = {
    enable = true;
    initialEmail = "pgadmin@local.host";
    initialPasswordFile = config.age.secrets.pgadmin.path;
  };

  # pgadmin's systemd unit reads this for its PATH
  services.postgresql.package = pkgs.postgresql_16;

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
    nautilus

    # Docker & K8s
    stern
    kubectx
    kubectl
    kubectl-cnpg
    docker-buildx
    docker-compose

    # Google Cloud
    (pkgs.google-cloud-sdk.withExtraComponents [
      pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
    ])

  ];
}
