#!/run/current-system/sw/bin/bash

read -p 'Message: ' msg

rm -f ./user.nix

git add -A
git commit -m "$msg"
git push -u ourGithub unstable
