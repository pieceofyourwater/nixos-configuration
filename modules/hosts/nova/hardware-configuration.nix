{ ... }: {
  flake.nixosModules.hardware-configuration = {
    # Paste generated hardware-configuration.nix file here
    nixpkgs.system = "x86_64-linux";
  };
}
