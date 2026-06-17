{ ... }: {
  flake.nixosModules.virtualization = { ... }: {
    virtualisation.docker = {
      enable = true;
      storageDriver = "btrfs";
    };

    # Qemu (KVM) with Virt-Manager
    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    users.groups.libvirtd.members = [ "kyle" ];
    virtualisation.spiceUSBRedirection.enable = true;

  };
}
