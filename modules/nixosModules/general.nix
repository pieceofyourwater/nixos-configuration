{ ... }: {
  flake.nixosModules.general = {
    programs.docker.enable = true;

  };
}
