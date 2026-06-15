{ inputs, self, ... }:
{

  flake = {
    nixosConfigurations.nova = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        self.nixosModules.hostNova
      ];
    };
    nixosModules.hostNova = { pkgs, ... }: {
      imports = [
        self.nixosModules.hardwareConfiguration

        # Disko
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.hostNova

      ];
    };
  };
}
