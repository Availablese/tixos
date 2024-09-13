#!/run/current-system/sw/bin/bash

if [ "$1" = "--help" ]; then
    echo "git-push.sh -> <user> -> <msg> -> <repo> -> <branch>"
fi
if [ "$1" = "timo" ] || [ "$1" = "matteo" ]; then 
    rm -f ~/.modular-nixos-configuration/users/user.nix 
    
    git add -A
    
    git commit -m "$2"
    
    git push -u $3 $4
    
    ~/.modular-nixos-configuration/bash/userQuery.sh $1

    git add -A
fi
