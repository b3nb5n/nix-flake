flakeInputs: {
  homeConfigurations."ben@fadedrya" =
    flakeInputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import flakeInputs.nixpkgs { system = "x86_64-linux"; };
      modules = [ ../base/home.nix ./home.nix ];
      extraSpecialArgs = { inherit flakeInputs; };
    };
}
