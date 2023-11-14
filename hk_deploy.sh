#!/bin/bash
repo_url="https://github.com/uk365/FZBypassBot"
repo_branch='main'

if [ -z "$repo_url" ] || [ -z "$repo_branch" ]; then
  echo "REPO_URL or REPO_BRANCH environment variable is not set. Exiting ..."
  exit 1
fi

if [ -d ".git" ]; then
  rm -rf .git
fi

git init -q
git config --global user.email drxxstrange@gmail.com
git config --global user.name SilentDemonSD
git remote add origin $repo_url
git fetch origin -q
git reset --hard origin/$repo_branch -q

pip install -r requirements.txt --quiet

if [ -z "bash start.sh" ]; then
  echo "START_CMD not specified. Exiting Now ..."
  exit 1
fi

echo "MrTamilKiK"
eval "$start_cmd"
