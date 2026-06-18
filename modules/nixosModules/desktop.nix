{ ... }: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    services.libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
      touchpad.tapping = true;
    };

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.excludePackages = [ pkgs.xterm ];

    services.udev.extraRules = ''
      # Disable ELAN Touchscreen by matching its device attribute
      SUBSYSTEM=="input", ATTRS{name}=="*ELAN*", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    '';

    environment.systemPackages = [
      pkgs.gnomeExtensions.blur-my-shell
    ];

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

    programs.firefox.enable = true;
  };
}
