#!/run/current-system/sw/bin/bash

if [ "$1" = 'timo' ]; then
    echo "{
    user = \"timo\";
}" > ~/.modular-nixos-configuration/users/user.nix
fi
if [ "$1" = 'matteo' ]; then
    echo "{i
    user = \"matteo\";
}" > ~/.modular-nixos-configuration/users/user.nix
fi
