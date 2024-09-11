#!/run/current-system/sw/bin/bash

read -p 'Username: ' user

if [ "$user" == 'timo' ]; then
    echo "{
    user = "timo";
}" > ./user.nix
fi
if [ "$user" == 'matteo' ]; then
    echo "{
    user = "matteo";
}" > ./user.nix
fi
