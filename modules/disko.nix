{ inputs, self, ... }:
{
  flake.diskoConfigurations.default = self.diskoConfigurations.hostNova;

  flake.diskoConfigurations.hostNova = {
    disko = {
      devices = {
        disk = {
          main = {
            device = "/dev/nvme0n1";
            type = "disk";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  priority = 1;
                  name = "ESP";
                  size = "1G";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };

                root = {
                  size = "100%";
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ]; # Force overwrite if existing data is present

                    # Define subvolumes inside the pool
                    subvolumes = {
                      # Root directory subvolume
                      "@" = {
                        mountpoint = "/";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };

                      # Home directory subvolume
                      "@home" = {
                        mountpoint = "/home";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };

                      # Nix store subvolume
                      "@nix" = {
                        mountpoint = "/nix";
                        mountOptions = [
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
