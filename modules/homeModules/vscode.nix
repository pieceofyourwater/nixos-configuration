{ ... }: {
  flake.homeModules.vscode = { lib, ... }: {
    programs.vscode = {
      enable = true;
      userSettings = {
        # --- Code Editor Font ---
        "editor.fontFamily" =
          lib.mkForce "'JetBrainsMono Nerd Font', 'JetBrains Mono', Consolas, 'Courier New', monospace";
        "editor.fontLigatures" = lib.mkForce true; # JetBrains Mono looks amazing with ligatures enabled
        "editor.fontSize" = lib.mkForce 14; # Adjust to your liking

        # --- Integrated Terminal Font ---
        "terminal.integrated.fontFamily" = lib.mkForce "'JetBrainsMono Nerd Font'";
        "terminal.integrated.fontSize" = lib.mkForce 14;

        # --- Markdown & Text Preview Font ---
        "markdown.preview.fontFamily" =
          lib.mkForce "'Ubuntu', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif";

        # --- UI Customization (Optional) ---
        # VS Code doesn't let you easily change the main UI sidebar font via standard settings,
        # but setting the window zoom or using specific themes pairs beautifully with Ubuntu.
        "window.zoomLevel" = lib.mkForce 1;
      };
    };
  };
}
