{ inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, ... }: {

    imports = [
      inputs.lsfg-vk-flake.nixosModules.default
    ];

    services.lsfg-vk = {
      enable = true;
      ui.enable = true; # installs gui for configuring lsfg-vk
    };

    programs = {
      steam.enable = true;
      steam.extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
      gamemode.enable = true;
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libva
        vulkan-tools
        vulkan-loader
      ];
    };

    services.joycond.enable = true;

    environment.systemPackages = [
      pkgs.mangohud
    ];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/kyle/.steam/root/compatibilitytools.d";
    };
  };
}
