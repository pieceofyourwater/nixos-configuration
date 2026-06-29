{ inputs, ... }: {
  flake.nixosModules.stylix = { pkgs, ... }: {
    imports = [
      inputs.stylix.nixosModules.stylix
    ];

    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };

        sansSerif = {
          package = pkgs.ubuntu-classic;
          name = "Ubuntu";
        };

        serif = {
          package = pkgs.ubuntu-classic;
          name = "Ubuntu";
        };

        # sizes = {
        #   applications = 12;
        #   terminal = 12;
        # };
      };
    };
  };
}
