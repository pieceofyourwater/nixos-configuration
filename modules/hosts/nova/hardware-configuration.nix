{ ... }: {
  flake.nixosModules.hardware-configuration = {
    # Paste generated hardware-configuration.nix file here
    nixpkgs.hostPlatform = "x86_64-linux";
  };
}
