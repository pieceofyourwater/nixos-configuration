This is my personal [NixOS](https://nixos.org/) configuration.

## Framework ##
My config is structured using the [Dendritic Pattern](https://github.com/mightyiam/dendritic), which is powered mainly by [flake-parts](https://flake.parts/).

## Structure ##
Flake:

├───diskoConfigurations 
│   └──hostNova: Disko module
├───homeConfigurations 
│   └──home-manager: Home Manager configuration
├───homeModules 
│   ├──vscode: Home Manager module
│   ├──zsh: Home Manager module
│   └──development: Home Manager module
├───nixosConfigurations
│   └───nova: NixOS configuration
├───nixosModules
│   ├───bluetooth: NixOS module
│   ├───desktop: NixOS module
│   ├───gaming: NixOS module
│   ├───general: NixOS module
│   ├───hardwareNova: NixOS module
│   ├───homeKyle: NixOS module (home-manager)
│   ├───hostNova: NixOS module
│   ├───stylix: NixOS module
│   └───virtualization: NixOS module
└───packages
    └───x86_64-linux
        └───neovim: package 'nvf-with-helpers'


Files:

├── flake.lock
├── flake.nix
├── modules
│   ├── disko.nix
│   ├── homeModules
│   │   ├── development.nix
│   │   ├── vscode.nix
│   │   └── zsh.nix
│   ├── hosts
│   │   └── nova
│   │       ├── configuration.nix
│   │       ├── hardware-configuration.nix
│   │       └── home.nix
│   ├── nixosModules
│   │   ├── bluetooth.nix
│   │   ├── desktop.nix
│   │   ├── gaming.nix
│   │   ├── general.nix
│   │   ├── stylix.nix
│   │   └── virtualization.nix
│   └── packages
│       └── nvf.nix
└── README.md
