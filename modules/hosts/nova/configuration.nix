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

      networking = {
        hostName = "nova";
        networkmanager.enable = true;
      };

      time.timeZone = "America/Jamaica";

      boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;

        kernelPackages = pkgs.linuxPackages_latest;
      };

      users.users.kyle = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [
          "wheel"
          "input"
          "audio"
          "network"
        ];
      };

      zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
      };
    };
  };
}
