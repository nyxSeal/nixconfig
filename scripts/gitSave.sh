#! /bin/zsh

git add -v ~/.nixconfig/*
git add -v ~/.nixconfig/.gitignore

echo -n "Commit message: "
read -r commitMessage

git commit -m "$commitMessage"

git pull --rebase

git push --set-upstream origin main
