{ config, pkgs, ...}:

let
  user = import ../../../users/user.nix;
  vars = import ../../../users/${user.user}/variables.nix;
in {

  home-manager.sharedModules = [{

    # git config
    programs.git = {
      enable = true;
      userName = vars.gitUser;
      userEmail = vars.gitMail;
      extraConfig = {
        init.defaultBranch = vars.defaultBranch;
      };
    };
  }];
}
