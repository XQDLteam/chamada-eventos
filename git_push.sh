#!/bin/bash
# contributors: kd, 
git pull
find . -type f -name ._\* -exec rm -f {} \;
git add .
git ls-files --others --exclude-from=.git/info/exclude
TIME=`date`
git commit -m "last updates done at $TIME" .gitignore
git push
