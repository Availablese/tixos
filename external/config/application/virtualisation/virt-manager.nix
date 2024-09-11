{ config, pkgs, ... }:

let
  user = import ../../../../users/user.nix;
  vars = import ../../../../users/${user.user}/variables.nix;
in {
  # Enable virt-manager and dconf
  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  # Enable libvirtd
  virtualisation.libvirtd = {
    enable = true;
  };

  # Ensure user is added to the libvirtd group
  users.users.${vars.username}.extraGroups = [ "libvirtd" ];

  # Kernel module and virtualization settings specific to AMD
  boot.kernelModules = [ "kvm" "kvm-amd" ];  # Use "kvm-amd" for AMD CPUs
  boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ]; # Enable IOMMU for AMD

}
