#! /bin/zsh

set -o errexit

cd ~/.nixconfig

echo -n "generate new github ssh key (y/n): "
read -r generateGitHubKeyOrNot

if [[ "$generateGitHubKeyOrNot" == "y" ]]; then

  ssh-keygen -C "main" -a 32 -f ~/.ssh/id_ed25519_github
  cat ~/.ssh/id_ed25519_github.pub
  echo 
  echo "Go to https://github.com/settings/keys, create a new SSH key, and then paste the string above"

  echo -n "press enter when done"
  read -r finishedKeyEntered
  wait

  git remote remove origin

  git remote add origin github.com:nyxSeal/nixconfig.git

fi

chmod 600 ~/.ssh/id_ed25519_github

ssh-add ~/.ssh/id_ed25519_github

mkdir secrets
cd secrets
touch secrets.nix
