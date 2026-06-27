{ self, ... }: {
  flake.homeModules.development = { pkgs, ... }: {
    home.packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
      pkgs.lazygit
      pkgs.tmux
      pkgs.git

      # Compilers, Interpereters and Language Toolkits
      pkgs.clang
      pkgs.python3
      pkgs.nodejs
      pkgs.ghc
      pkgs.cabal-install
      pkgs.cargo
    ];
  };
}
