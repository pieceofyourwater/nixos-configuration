{ ... }: {
  flake.homeModules.foot = {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          # This acts as an alpha multiplier for your Stylix moonlight background
          alpha = "0.85"; 
        };

        # Foot delegates window-level blur to your desktop compositor (Mutter/GNOME or Hyprland)
        # But we lock down its core behavior right here
        scrollback = {
          lines = 0; # You use tmux for scrollback history, so set this to 0 to save memory!
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}
