#!/bin/bash

set -e

# Get current version
current_version=$(ag -o --no-filename "v[0-9]*\..\.." | sed 's/v//g')

# Extract major version & bump new version
major_version=$(echo $current_version | cut -d. -f1)
new_version="$((major_version + 1)).0.0"

echo "Current version:   $current_version"
echo "Major version:     $major_version"
echo "Bumped up version: $new_version"

echo ""

echo "git flow release start $new_version"
git flow release start $new_version

echo "ag -l $current_version | xargs sed -i '' \"s/$current_version/$new_version/g\""
ag -l $current_version | xargs sed -i '' "s/$current_version/$new_version/g"

echo "git add --all && git commit -am \"bump to version $new_version\""
git add --all && git commit -am "bump to version $new_version"

echo "git flow release finish '$new_version' -m \"Release v$new_version\""
export GIT_MERGE_AUTOEDIT=no
git flow finish -m "Release v$new_version"
unset GIT_MERGE_AUTOEDIT

echo "git checkout develop"
git checkout develop

echo "git push"
git push origin develop

echo "git checkout master"
git checkout master

echo "git push origin master --tags"
git push origin master --tags