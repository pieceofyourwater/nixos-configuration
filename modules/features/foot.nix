{ ... }: {
  flake.homeModules.foot = {
    programs.foot = {
      enable = true;

      settings = {
        main = {
        };
        scrollback = {
          lines = 0; 
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
    stylix.opacity.terminal = 0.8;
  };
}
