{ ... }: {
  flake.homeModules.vscode = { lib, ... }: {
    programs.vscode = {
      enable = true;
      profiles.default.userSettings = {
        # --- Code Editor Font ---
        "editor.fontFamily" =
          lib.mkForce "'JetBrainsMono Nerd Font', 'JetBrains Mono', Consolas, 'Courier New', monospace";
        "editor.fontLigatures" = lib.mkForce true; 
        "editor.fontSize" = lib.mkForce 14; 

        # --- Integrated Terminal Font ---
        "terminal.integrated.fontFamily" = lib.mkForce "'JetBrainsMono Nerd Font'";
        "terminal.integrated.fontSize" = lib.mkForce 14;

        # --- Markdown & Text Preview Font ---
        "markdown.preview.fontFamily" =
          lib.mkForce "'Ubuntu', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif";

        # --- UI Customization (Optional) ---
        "window.zoomLevel" = lib.mkForce 1;
      };
    };
  };
}
