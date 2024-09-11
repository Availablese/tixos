{ config, lib, pkgs, ...}:

let
  user = import ../../../../users/user.nix;
  vars = import ../../../../users/${user.user}/variables.nix;
in {

  environment.systemPackages = with pkgs; [
    waybar
  ];

  home-manager.sharedModules = [{

    programs.waybar = {
      enable = true;
    };
    
    # Cascading Style Sheet
    home.file.".config/waybar/style.css".text = ''
    * {
      border: none;
      border-radius: 0;
      font-family: Hack Nerd Font;
    }

    #battery,
    #clock,
    #wireplumber {
      padding: 0 10px;
      margin: 0 5px;
    }

    window#waybar {
      background: rgba(${config.lib.stylix.colors.base00-rgb-r}, ${config.lib.stylix.colors.base00-rgb-g}, ${config.lib.stylix.colors.base00-rgb-b}, ${vars.opacity});
      color: #${config.lib.stylix.colors.base05};
      border-bottom: 2px solid #${config.lib.stylix.colors.base03};
    }

    tooltip {
      background: #${config.lib.stylix.colors.base00};
      border: 2px solid #${config.lib.stylix.colors.base03};
    }

    #workspaces button {
      color: #${config.lib.stylix.colors.base05};
    }

    #workspaces button.active {
      color: #${config.lib.stylix.colors.base04};
      border-bottom: 2px solid #${config.lib.stylix.colors.base04};
    }
    '';

    # Configuration
    home.file.".config/waybar/config.jsonc".text = ''
      {
        "layer": "top",
        "position": "top",

        "modules-left": [
    "hyprland/workspaces",
        ],

        "modules-center": [
      "hyprland/window"
        ],

        "modules-right": [
          "wireplumber",
    "battery",
          "clock"
        ],

        "hyprland/window": {
            "format": "{}",
            "max-length": 50
        },

        "battery": {
            "format": "{icon} {capacity}%",
            "format-icons": ["󰂃", "󰂃", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"],
            "tooltip-format": "{time}"
        },

        "clock": {
            "format": "󱑆 {:%H:%M }",
            "format-alt": "󱑆 {:%a, %d. %b  %H:%M }",
       },

        "wireplumber": {
          "format": "{icon} {volume}% ",
          "format-muted": " ",
          "scroll-step": "1",
          "format-icons": ["", " ", " "]
        }
      }
    '';

  }];
}
