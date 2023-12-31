{
  nixpkgs-stable,
  nixpkgs-unstable,
  nur,
  home-manager,
  ...
}@inputs: let
  platform = "x86_64-linux";
  systemName = "bnixdsk";

  pkgsArgs = {
    system = platform;
    config = {
      allowUnfree = true;
      allowUnfreePredicate =  _: true;
    };
  };

  nixpkgsStable = import nixpkgs-stable pkgsArgs;
  nixpkgsUnstable = import nixpkgs-unstable pkgsArgs;
  nurpkgs = import nur { pkgs = nixpkgsStable; nurpkgs = nixpkgsStable; };

  sharedArgs = {
    registries = {
      inherit
        nixpkgsStable
        nixpkgsUnstable
        nurpkgs;
    };

    usrLib = import ../../lib inputs;
  };

  sharedModules = [
    ./shared.nix
  ];
in {
  nixosConfigurations.${systemName} = nixpkgs-stable.lib.nixosSystem {
    pkgs = nixpkgsStable;
    system = platform;
    specialArgs = sharedArgs // {};
    modules = sharedModules ++ [
      ./config.nix

      ../../modules/nixos/amd-gpu.nix
      ../../modules/nixos/bluetooth.nix
      ../../modules/nixos/efi-boot.nix
      ../../modules/nixos/firewall.nix
      ../../modules/nixos/network-manager.nix
      ../../modules/nixos/portals.nix
      ../../modules/nixos/sound.nix

      {
        networking.hostName = systemName;
      }
    ];
  };

  homeConfigurations = {
    "ben@${systemName}" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgsStable;
      extraSpecialArgs = sharedArgs // {};
      modules = sharedModules ++ [
        ./home.nix

        ../../modules/hm/environments/hyprland
        ../../modules/hm/features
        ../../modules/hm/local

        {
          home.username = "ben";
        }
      ];
    };
  };
}