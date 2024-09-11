{ config, pkgs, ... }:

let
  user = import ../../../../users/user.nix;
  vars = import ../../../../users/${user.user}/variables.nix;
in {

  environment.systemPackages = with pkgs; [
    wofi
  ];

  home-manager.sharedModules = [{

    programs.wofi = {
      enable = true;

      settings = {
        hide_scoll = true;
        allow_markup = true;
      };

      style  = ''
        * {
          font-family: Hack Nerd Font;
	        color: #${config.lib.stylix.colors.base05};
	        border: none;
        }

        #window {
          background: rgba(${config.lib.stylix.colors.base00-rgb-r}, ${config.lib.stylix.colors.base00-rgb-g}, ${config.lib.stylix.colors.base00-rgb-b}, ${vars.opacity});
	        border: 2px solid #${config.lib.stylix.colors.base03};
        }

        #outer-box {
	        border: 2px solid #${config.lib.stylix.colors.base03};
        }

        #input {
          background: #${config.lib.stylix.colors.base00};
	        border: none;
        }

        #entry:selected {
          background: #${config.lib.stylix.colors.base03};
	        color: #${config.lib.stylix.colors.base04}:
	        border: none;
        }
      '';
    };
  }];
}
