{ ... }: {
  flake.nixosModules.gnome = { pkgs, ... }: {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.excludePackages = [ pkgs.xterm ];

    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-connections
      epiphany
      geary
      totem
      seahorse
      gnome-maps
      gnome-clocks
      gnome-contacts
      gnome-music
      simple-scan
      adwaita-icon-theme
    ];

    environment.systemPackages = [
      pkgs.gnomeExtensions.blur-my-shell
    ];
  };
}
