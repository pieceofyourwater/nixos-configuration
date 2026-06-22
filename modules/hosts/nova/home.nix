{ inputs, self, ... }: {
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  flake.nixosModules.homeKyle = {

    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home-manager.backupFileExtension = "backup";

    home-manager.users.kyle = { pkgs, ... }: {
      imports = [
        self.homeModules.vscode
        self.homeModules.zsh
        self.homeModules.development
        self.homeModules.foot
        self.homeModules.zen
      ];

      home = {
        username = "kyle";
        homeDirectory = "/home/kyle";
        stateVersion = "26.05";
        packages = [
          pkgs.gimp
          pkgs.libreoffice-fresh
        ];
      };
    };
  };
}
