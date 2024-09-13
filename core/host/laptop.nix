{ config, pkgs, ...}:

{
  imports = [
    # Color Manager
    ../../external/config/color-manager/stylix.nix

    # Desktop Environment
    ../../external/config/desktop-environment/window-manager/hyprland.nix
    ../../external/config/desktop-environment/status-bar/waybar.nix
    ../../external/config/desktop-environment/wallpaper-setter/hyprpaper.nix
    ../../external/config/desktop-environment/notification-daemon/dunst.nix
    ../../external/config/desktop-environment/app-launcher/wofi.nix

    # Terminal Environment
    ../../external/config/terminal/emulator/kitty.nix
    ../../external/config/terminal/shell/fish.nix
    ../../external/config/terminal/prompt/starship.nix
    ../../external/config/terminal/editor/neovim.nix

    # Utility
    ../../external/config/utility/git.nix

    # Apps
    ../../external/config/application/browser/qutebrowser.nix
    ../../external/config/application/virtualisation/virt-manager.nix
    ../../external/config/application/notes/obsidian.nix
    ../../external/config/application/discord/vesktop.nix
    ../../external/config/application/IDE/Intellij_IDEA.nix
  ];
}
