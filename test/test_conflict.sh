#! bin/bash

set -eu

RED='\033[0;31m'
NC='\033[0m' # No Color

# check if there are 2 parent commits
commit_count=$(git --no-pager show --no-patch --pretty=format:"%p" main | wc -w)

if [ $(( commit_count )) -eq 2 ]; then
    # do nothing
    :
else
    echo -e "${RED}Merge commit should have 2 parent commits. You should merge a branch into main.${NC}"
    exit 1
fi

echo "ok"
exit 0
