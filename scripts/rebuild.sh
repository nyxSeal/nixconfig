#! /bin/zsh



set -o errexit

cd ~/.nixconfig



echo
echo "Formatting nix files..."
alejandra ~/.nixconfig



echo
echo
echo -n "Update flake.lock? (y/n): "
read -r updateLockOrNot

if [[ "$updateLockOrNot" = "y" ]]; then
  nix flake update
else
  echo
  echo
  echo "Skipping flake.lock update..."
fi



git add -i ~/.nixconfig/*



echo
echo
echo -n "Rebuild system? (y/n): "
read -r rebuildOrNot

if [[ "$rebuildOrNot" = "y" ]]; then

  hostName="$(hostname)"
  echo
  echo
  sudo nixos-rebuild switch --show-trace --flake ~/.nixconfig#$hostName

else
  echo
  echo
  echo "Skipping rebuild..."
fi



echo
echo
echo -n "Commit? (y/n): "
read -r commitOrNot

if [[ "$commitOrNot" = "y" ]]; then

  currentBranch="$(git branch --show-current)"
  echo
  echo
  echo -n "Commit message: "
  read -r commitMessage

  echo
  echo
  git commit -m "$commitMessage"
  echo
  git pull origin $currentBranch --rebase
  echo
  git push origin $currentBranch

else
  echo
  echo
  echo "Skipping commit..."
fi
