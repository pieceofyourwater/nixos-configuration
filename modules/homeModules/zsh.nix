{ inputs, ... }: {
  flake.homeModules.zsh = { pkgs, ... }: {
    home.packages = [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.btop
      pkgs.fzf
    ];

    home.file."p10k.zsh".source = "${inputs.dotfiles}/.p10k.zsh";
    home.sessionPath = [
      "$HOME/.local/bin/"
    ];
    programs.zsh = {
      enable = true;
      initContent = "source ~/.p10k.zsh";
      shellAliases = {
        cd = "z";
        rebuild = "sudo nixos-rebuild switch";
      };
      plugins = [
        {
          name = "powerlevel10k-config";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
      oh-my-zsh.enable = true;
    };
    programs.zoxide.enable = true;
  };
}
