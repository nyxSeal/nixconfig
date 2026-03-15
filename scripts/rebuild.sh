#! /bin/zsh

cd ~/.nixconfig

alejandra ~/.nixconfig

git add ~/.nixconfig

git status

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
