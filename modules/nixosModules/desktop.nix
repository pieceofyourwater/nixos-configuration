{ ... }: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    services.libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
      touchpad.tapping = true;
    };

    services.xserver.enable = true;
    services.xserver.xterm.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.udev.extraRules = ''
      # Disable ELAN Touchscreen by matching its device attribute
      SUBSYSTEM=="input", ATTRS{name}=="*ELAN*", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    '';

    environment.systemPackages = [
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
    ];
  };
}
