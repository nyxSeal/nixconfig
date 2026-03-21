#! /bin/zsh

set -o errexit

cd ~/.nixconfig

echo
echo "Formatting nix files..."
alejandra ~/.nixconfig





git add -i ~/.nixconfig/*

echo -n "Rebuild system? (enter 'true' if true): "
read -r rebuildOrNot

if [ $rebuildOrNot = "true" ]; then

  echo -n "Host name:"
  read -r hostName
  echo
  sudo nixos-rebuild switch --flake ~/.nixconfig#$hostName

else
  echo
  echo "Skipping rebuild..."
fi






echo -n "Commit? (enter 'true' if true): "
read -r commitOrNot

if [ $commitOrNot = "true" ]; then

  currentBranch=(git branch --show-current)
  echo -n "Commit message: "
  read -r commitMessage
  git commit -m "$commitMessage"
  git pull origin $currentBranch --rebase
  git push origin $currentBranch

else
  echo "Skipping commit..."
fi
