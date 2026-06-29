{ ... }: {
  flake.homeModules.foot = {
    programs.foot = {
      enable = true;

      settings = {
        main = {
        };
        scrollback = {
          lines = 1000; 
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
    stylix.opacity.terminal = 0.8;
  };
}
