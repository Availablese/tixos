{ config, pkgs, ...}:

{
  imports = [
    # Color Manager
    ../../external/config/color-manager/stylix.nix
    # Desktop Enviroment
    ../../external/config/desktop-enviroment/window-manager/hyprland.nix
  ];
}
