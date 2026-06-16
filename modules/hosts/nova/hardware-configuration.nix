{ ... }: {
  flake.nixosModules.hardwareConfiguration = {
    # Paste generated hardware-configuration.nix file here
    system = "x86_64-linux";
  };
}
