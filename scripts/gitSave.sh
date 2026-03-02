#! /bin/zsh

git add -v ~/.nixconfig/*

echo -n "Commit message: "
read -r commitMessage

git commit -m "$commitMessage"

git pull origin main --rebase

git push --set-upstream origin main
