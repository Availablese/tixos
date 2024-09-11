#!/run/current-system/sw/bin/bash

rm -f ./user.nix

git add -A

read -p 'Message: ' msg
git commit -m "$msg"

git push -u ourGithub unstable
