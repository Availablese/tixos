#!/run/current-system/sw/bin/bash

sed -i -e 's#vars = import ../../../../core/system/variables.nix#user = import ../../../../users/user.nix;\n  vars = import ../../../../users/${user.user}/variables.nix#g' ~/.modular-nixos-configuration/*/*/*/*/*
sed -i -e 's#vars = import ../../../core/system/variables.nix#user = import ../../../users/user.nix;\n  vars = import ../../../users/${user.user}/variables.nix#g' ~/.modular-nixos-configuration/*/*/*/*/*
sed -i -e 's#vars = import ../../../../core/system/hardware-configuration.nix#user = import ../../../../users/user.nix;\n  vars = import ../../../../users/${user.user}/hardware-configuration.nix#g' ~/.modular-nixos-configuration/*/*/*/*/*

mkdir ~/.modular-nixos-configuration/users
mkdir ~/.modular-nixos-configuration/users/matteo
mkdir ~/.modular-nixos-configuration/users/timo

mv ~/.modular-nixos-configuration/core/system/variables.nix ~/.modular-nixos-configuration/users/matteo
mv ~/.modular-nixos-configuration/core/hardware-configuration.nix ~/.modular-nixos-configuration/users/matteo


