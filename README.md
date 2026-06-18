This is my personal [NixOS](https://nixos.org/) configuration.

## Framework ##
My config is structured using the [Dendritic Pattern](https://github.com/mightyiam/dendritic), which is powered mainly by [flake-parts](https://flake.parts/).

## Structure ##

```mermaid
graph TD
    Flake[Flake] --> DC[diskoConfigurations]
    DC --> hostNova[hostNova: Disko module]

    Flake --> HC[homeConfigurations]
    HC --> hm[home-manager: Home Manager configuration]

    Flake --> HM[homeModules]
    HM --> vscode[vscode: Home Manager module]
    HM --> zsh[zsh: Home Manager module]
    HM --> dev[development: Home Manager module]

    Flake --> NC[nixosConfigurations]
    NC --> nova[nova: NixOS configuration]

    Flake --> NM[nixosModules]
    NM --> blue[bluetooth: NixOS module]
    NM --> desk[desktop: NixOS module]
    NM --> game[gaming: NixOS module]
    NM --> gen[general: NixOS module]
    NM --> hwNova[hardwareNova: NixOS module]
    NM --> hKyle[homeKyle: NixOS module home-manager]
    NM --> hstNova[hostNova: NixOS module]
    NM --> stylix[stylix: NixOS module]
    NM --> virt[virtualization: NixOS module]

    Flake --> PKG[packages]
    PKG --> x86[x86_64-linux]
    x86 --> nvim[neovim: package nvf-with-helpers]
```

```mermaid
graph TD
    Root[Project Root] --> flock[flake.lock]
    Root --> fnix[flake.nix]
    Root --> readme[README.md]
    Root --> MOD[modules]

    MOD --> disko[disko.nix]
    
    MOD --> HM[homeModules]
    HM --> dev[development.nix]
    HM --> vsc[vscode.nix]
    HM --> zsh[zsh.nix]

    MOD --> HOSTS[hosts]
    HOSTS --> NOVA[nova]
    NOVA --> config[configuration.nix]
    NOVA --> hw[hardware-configuration.nix]
    NOVA --> home[home.nix]

    MOD --> NM[nixosModules]
    NM --> blue[bluetooth.nix]
    NM --> desk[desktop.nix]
    NM --> game[gaming.nix]
    NM --> gen[general.nix]
    NM --> stylix[stylix.nix]
    NM --> virt[virtualization.nix]

    MOD --> PKGS[packages]
    PKGS --> nvf[nvf.nix]
```

