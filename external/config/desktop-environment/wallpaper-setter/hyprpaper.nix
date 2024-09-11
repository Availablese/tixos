{ config, pkgs, ...}:

let
  user = import ../../../../users/user.nix;
  vars = import ../../../../users/${user.user}/variables.nix;
in {
  environment.systemPackages = with pkgs; [
    hyprpaper
  ];

  home-manager.sharedModules = [{
    services.hyprpaper = {
      enable = true;

      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = [
          "~/${vars.wallpaperPath}"
        ];

        wallpaper = [
          "eDP-1,~/${vars.wallpaperPath}"
        ];
      };
    };
  }];
}
