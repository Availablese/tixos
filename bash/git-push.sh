#!/run/current-system/sw/bin/bash

rm -f ~/.modular-nixos-configuration/users/user.nix 

git add -A

read -p 'Message: ' msg
git commit -m "$msg"

read -p 'Repository: ' repo
read -p 'Branch: ' branch
git push -u $repo $branch

~/.modular-nixos-configuration/bash/userQuery.sh
