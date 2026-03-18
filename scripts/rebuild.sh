#! /bin/zsh

set -o errexit

cd ~/.nixconfig

echo
echo "Formatting nix files..."
alejandra ~/.nixconfig





git add -v -i ~/.nixconfig/*

echo -n "Rebuild system? (enter 'true' if true): "
read -r rebuildOrNot

if [[ "$rebuildOrNot" == "true" ]]; then

  echo -n "Host name:"
  read -r hostName
  echo
  sudo nixos-rebuild switch --flake ~/.nixconfig#$hostName

else
  echo
  echo "Skipping rebuild..."
fi






git status

git diff

echo -n "Commit? (enter 'true' if true): "
read -r commitOrNot

if [[ "$commitOrNot" == "true" ]]; then

  echo -n "Commit message: "
  read -r commitMessage
  git commit -m "$commitMessage"
  git pull origin main --rebase
  git push origin main

else
  echo "Skipping commit..."
fi
