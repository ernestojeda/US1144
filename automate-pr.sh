#!/bin/bash

count=${1:-3}
label=${2:-bug}

echo git checkout -b "US1144-$count"
echo touch "bugfix-$count"
git add . && git c "fix: bug $count"
git push origin "$(git rev-parse --abbrev-ref HEAD)"
new_pr=$(gh pr create -a ernestojeda -b main -H "$(git rev-parse --abbrev-ref HEAD)" -f -l "$label")
pr_number=$(basename "$new_pr")
gh pr merge "${pr_number}" -m
git checkout main
git pull