#! /bin/zsh

mkdir -v ~/.nixconfig

cd ~/.nixconfig
git init 

ssh-keygen -C "localMain" -a 32 -f ~/.ssh/id_ed25519_github
cat ~/.ssh/id_ed25519_github.pub
echo 
echo "Go to https://github.com/settings/keys, create a new SSH key, and then paste the string above"

echo -n "press enter when done"
read -r finishedKeyEntered
wait

git remote add origin github.com:nyxSeal/nixconfig.git

