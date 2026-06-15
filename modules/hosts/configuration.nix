{ inputs, self, ... }: {

    flake.nixosConfigurations.nova = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.hardwareConfiguration
        ];
    };
}
