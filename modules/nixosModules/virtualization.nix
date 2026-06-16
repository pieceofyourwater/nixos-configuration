{ ... }: {
  flake.nixosModules.virtualization = { pkgs, ... }: {
    virtualisation.docker = { 
      enable = true;
      storageDriver = "btrfs";
    };

    # Qemu (KVM) with Virt-Manager
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    users.groups.libvirtd.members = ["your_username"];
    virtualisation.spiceUSBRedirection.enable = true;

  };
}
