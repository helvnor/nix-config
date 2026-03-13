{
  description = "My NixOS and nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    dotfiles = {
      url = "github:helvnor/dotfiles";
      flake = false;
    };

  };

  outputs =
    {
      nixpkgs,
      darwin,
      home-manager,
      agenix,
      dotfiles,
      ...
    }@inputs:

    {

      ###  MBP14  ###
      darwinConfigurations.mbp14 = darwin.lib.darwinSystem {
        specialArgs = { inherit inputs; };
        system = "aarch64-darwin";

        # SYSTEM
        modules = [
          ./hosts/mbp14/system.nix # General system configs
          ./hosts/mbp14/users.nix # Users config

          ./modules/darwin/homebrew.nix # Homebrew
          ./modules/shared/utility.nix # Utility packages

          agenix.nixosModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.norrman =
              { pkgs, ... }:
              {
                # HOME
                imports = [

                  # General home configs
                  ./hosts/mbp14/home.nix

                  # Packages
                  ./modules/shared/dev.nix
                  ./modules/shared/nvim.nix

                  agenix.homeManagerModules.default
                ];
              };
          }
        ];
      };

      ### ZENBOOK ###
      nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";

        # SYSTEM
        modules = [
          ./hosts/zenbook/system.nix # General system configs
          ./hosts/zenbook/users.nix # Users config
          ./hosts/zenbook/hardware-configuration.nix # UX3405M configs

          ./modules/nixos/laptop.nix # Laptop firmware

          ./modules/shared/utility.nix # Utility packages
          ./modules/shared/work.nix # Work packages

          ./modules/nixos/cosmic.nix

          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.norrman =
              { pkgs, ... }:
              {
                # HOME
                imports = [

                  # General home configs
                  ./hosts/zenbook/home.nix

                  # GUI
                  # ./modules/nixos/waybar.nix
                  # ./modules/nixos/wofi.nix
                  # ./modules/nixos/mako.nix
                  # ./modules/nixos/icons.nix
                  # ./modules/nixos/hypr.nix

                  # Packages
                  ./modules/shared/dev.nix
                  ./modules/shared/nvim.nix

                  agenix.homeManagerModules.default
                ];
              };
          }
        ];
      };

    };
}
