# Ippon Song Challenge 2
![LoadingScreen screenshot](https://github.com/simonguillochon/IpponSongChallenge2020/blob/master/src/assets/LoadingScreenScreenshot.png "LoadingScreen Screenshot")

## Installation
```
git@github.com:simonguillochon/IpponSongChallenge2020.git
npm install
```

## Lancer en developpement
```
npm run serve
```

## Deploiement en production
Compiler le projet en production
```
npm run build
```

Une fois mise à jour, récupérer la version du package.json
```
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')
```

Publier les changements sur la branche gh-pages
```
cd dist
git add -A
git commit -m $PACKAGE_VERSION
git push -f git@github.com:simonguillochon/IpponSongChallenge2020.git master:gh-pages
```

Faire le ménage derrière soi
```
cd -
rm -rf .dist/
```