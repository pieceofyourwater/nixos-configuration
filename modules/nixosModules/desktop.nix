{ self, ... }: {
  flake.nixosModules.desktop = { ... }: {
    imports = [
      # Only use one 
      # self.nixosModules.gnome
      self.nixosModules.kde
    ];

    services.libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
      touchpad.tapping = true;
    };

    services.udev.extraRules = ''
      # Disable ELAN Touchscreen by matching its device attribute
      SUBSYSTEM=="input", ATTRS{name}=="*ELAN*", ENV{LIBINPUT_IGNORE_DEVICE}="1"
    '';

    programs.firefox.enable = true;
  };
}
