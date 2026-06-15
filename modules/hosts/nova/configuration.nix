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
      systemd.services.NetworkManager-wait-online.enable = false;

      users.users.kyle = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [
          "wheel"
          "input"
          "audio"
          "network"
          "docker"
        ];
      };

      services.openssh.enable = true;

      environment.systemPackages = with pkgs; [
        vim
      ];

      environment.shells = [ "/etc/profiles/per-user/kyle/bin/zsh" ];

      zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
      };

      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

    };
  };
}
