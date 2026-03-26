#! /bin/zsh

set -o errexit

cd ~/.nixconfig

echo
echo "Formatting nix files..."
alejandra ~/.nixconfig





git add -i ~/.nixconfig/*

echo -n "Rebuild system? (y/n): "
read -r rebuildOrNot

if [ "$rebuildOrNot" = "y" ]; then

  hostName="$(hostname)"
  echo
  sudo nixos-rebuild switch --show-trace --flake ~/.nixconfig#$hostName

else
  echo
  echo "Skipping rebuild..."
fi





echo
echo -n "Commit? (y/n): "
read -r commitOrNot

if [ "$commitOrNot" = "y" ]; then

  currentBranch="$(git branch --show-current)"
  echo
  echo -n "Commit message: "
  read -r commitMessage

  echo
  git commit -m "$commitMessage"
  git pull origin $currentBranch --rebase
  git push origin $currentBranch

else
  echo
  echo "Skipping commit..."
fi
