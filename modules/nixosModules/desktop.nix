{ ... }: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    services.xserver = {
      enable = true;

      libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
        touchpad.tapping = true;
      };

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };

      displayManager.ly.enable = true;
    };

    services.xserver.config = ''
      Section "InputClass"
          Identifier "Disable ELAN Touchscreen"
          MatchIsTouchscreen "on"
          Option "Ignore" "on"
      EndSection
    '';

    environment.systemPackages = [
      pkgs.dmenu
      pkgs.xmobar
      pkgs.nitrogen
      pkgs.xclip
    ];
  };
}
