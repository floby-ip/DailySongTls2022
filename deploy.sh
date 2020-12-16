#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# get current package.json version
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

# git commands to commit changes on gh-pages
git init
git add -A
git commit -m $PACKAGE_VERSION
git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -
