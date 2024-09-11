{ config, pkgs, lib, ...}:

let
  user = import ../../../../users/user.nix;
  vars = import ../../../../users/${user.user}/variables.nix;
in {
    
    environment.systemPackages = with pkgs; [
      dunst
    ];

    home-manager.sharedModules = [{

    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 300;
          offset = "20x20";
          origin = "top-right";
          transparency = "${vars.opacity}";
          frame_color = lib.mkDefault "#${config.lib.stylix.colors.base03}";
          font = lib.mkDefault "Hack Nerd Font 9";
        };

        urgency_normal = {
          background = lib.mkDefault "#${config.lib.stylix.colors.base00}";
          foreground = lib.mkDefault "#${config.lib.stylix.colors.base05}";
          timeout = 10;
        };
      };
    };
  }];
}
