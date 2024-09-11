#!/run/current-system/sw/bin/bash

read -p 'Username: ' user

if [ "$user" == 'timo' ]; then
    echo "{
    user = \"timo\";
}" > ~/.modular-nixos-configuration/users/user.nix
fi
if [ "$user" == 'matteo' ]; then
    echo "{i
    user = \"matteo\";
}" > ~/.modular-nixos-configuration/users/user.nix
fi
