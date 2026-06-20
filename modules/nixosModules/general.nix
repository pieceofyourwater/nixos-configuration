{ inputs, ... }: {
  flake.nixosModules.general = { pkgs, ... }: {
    environment.systemPackages = [
      inputs.areofyl-fetch.packages.${pkgs.system}.default
    ];
  };
}
