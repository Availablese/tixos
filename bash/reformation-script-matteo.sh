#!/run/current-system/sw/bin/bash

sed -i -e 's#vars = import ../../../../core/system/variables.nix#user = import ../../../../users/user.nix;\n  vars = import ../../../../users/${user.user}/variables.nix#g' ~/.modular-nixos-configuration/*/*/*/*/*
sed -i -e 's#vars = import ../../../core/system/variables.nix#user = import ../../../users/user.nix;\n  vars = import ../../../users/${user.user}/variables.nix#g' ~/.modular-nixos-configuration/*/*/*/*/*

mkdir ~/.modular-nixos-configuration/users

mv ~/.modular-nixos-configuration/core/system/variables.nix ~/.modular-nixos-configuration/users
mv ~/.modular-nixos-configuration/core/hardware-configuration.nix ~/.modular-nixos-configuration/users
