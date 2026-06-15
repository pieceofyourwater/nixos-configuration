{ ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {
    programs = {
      steam.enable = true;
      gamemode.enable = true;
    };

    services.joycond.enable = true;

    environment.systemPackages = [
      pkgs.protonup-ng
    ];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/kyle/.steam/root/compatibilitytools.d";
    };
  };
}
