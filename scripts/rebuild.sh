#! /bin/zsh

git add -v -A ~/.nixconfig/*

echo -n "Rebuild system? (enter 'true' if true): "
read -r rebuildOrNot

if [[ "$rebuildOrNot" == "true" ]]; then
  sudo nixos-rebuild switch --flake ~/.nixconfig#
else
  echo "Skipping rebuild..."
fi

cd ~/.nixconfig

echo "Formatting nix files..."
alejandra ~/.nixconfig

git add ~/.nixconfig

git status

git diff untested

echo -n "Commit? (enter 'true' if true): "
read -r commitOrNot

if [[ "$commitOrNot" == "true" ]]; then
  echo -n "Commit message: "
  read -r commitMessage

  git commit -m "$commitMessage"

  git pull origin untested --rebase

  git push origin untested
else
  echo "Skipping commit..."
fi


git diff untested main

echo -n "Merge with main branch? (enter 'true' if true): "
read -r mergeOrNot

if [[ "$mergeOrNot" == "true" ]]; then

  echo -n "Merge message: "
  read -r mergeMessage

  git checkout main

  git merge --squash untested

  git commit -m "$mergeMessage"

  git checkout untested
else
  echo "Skipping merge..."
fi
