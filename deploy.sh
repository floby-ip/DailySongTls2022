#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# get package.json version tag
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m $PACKAGE_VERSION

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:simonguillochon/IpponSongChallenge2020.git master:gh-pages

cd -
