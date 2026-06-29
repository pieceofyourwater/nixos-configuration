{ inputs, self, ... }: {
  flake.nixosModules.desktop = { ... }: {
    imports = [
      self.nixosModules.kde
      self.nixosModules.mangowc
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

  flake.homeModules.waylandWmUtils = { pkgs, ... }: {
    home.packages = with pkgs; [
      wmenu
      wl-clipboard
      swaybg
      grim
      slurp
    ];
  };
  flake.nixosModules.mangowc = { ... }: {
    imports = [
      inputs.mangowc.nixosModules.mango
    ];

    programs.mango.enable = true;
    programs.mango.addLoginEntry = true;
  };

  flake.homeModules.mangowc = { ... }: {
    imports = [
      inputs.mangowc.hmModules.mango
    ];

    wayland.windowManager.mango = {
      enable = true;
      settings = {
        blur = 1;
        blur_optimized = 1;
        blur_params = {
          radius = 5;
          num_passes = 2;
        };
        border_radius = 6;
        focused_opacity = 1.0;

        # Animations - use underscores for multi-part keys
        animations = 1;
        animation_type_open = "slide";
        animation_type_close = "zoom";
        animation_duration_open = 100;
        animation_duration_close = 200;

        # Or use nested attrs (will be flattened with underscores)
        animation_curve = {
          open = "0.46,1.0,0.29,1";
          close = "0.08,0.92,0,1";
        };

        # Use lists for duplicate keys like bind and tagrule
        bind = [
          "SUPER+SHIFT,r,reload_config"
          "SUPER,space,spawn,wmenu-run -l 10"
          "SUPER,t,spawn,foot"
          "SUPER,r,setkeymode,resize"  
          "SUPER,q,killclient"

          "SUPER,j,focusstack,next"
          "SUPER,k,focusstack,prev"
          "SUPER,h,focusdir,left"
          "SUPER,l,focusdir,right"

          
          "SUPER,1,comboview,1"
          "SUPER,2,comboview,2"
          "SUPER,3,comboview,3"
          "SUPER,4,comboview,4"
          "SUPER,5,comboview,5"
          "SUPER,6,comboview,6"
          "SUPER,7,comboview,7"
          "SUPER,8,comboview,8"
          "SUPER,9,comboview,9"
        ];

        tagrule = [
          "id:1,layout_name:tile"
          "id:2,layout_name:scroller"
        ];

        # Keymodes (submaps) for modal keybindings
        keymode = {
          resize = {
            bind = [
              "NONE,Left,resizewin,-10,0"
              "NONE,Escape,setkeymode,default"
            ];
          };
        };
      };
      extraConfig = ''
        mousebind=SUPER,btn_left,moveresize,curmove
        mousebind=SUPER,btn_right,moveresize,curresize

        gappih=0
        gappiv=0
        gappoh=0
        gappov=0
        borderpx=1
        focuscolor=0x191f28ff
        no_border_when_single=0 
      '';
      autostart_sh = ''
        swaybg -i ${inputs.non-nix}/walls/moonlight-tree.png
      '';
    };
  };

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

  flake.nixosModules.kde = { pkgs, ... }: {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs; [
      kdePackages.elisa # Music player
      kdePackages.kdepim-runtime # Akonadi agents
      kdePackages.kmahjongg
      kdePackages.kmines
      kdePackages.konversation # IRC client
      kdePackages.kpat # Solitaire
      kdePackages.ksudoku
      kdePackages.ktorrent
    ];
  };
}
