#!/bin/bash
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then

    echo -e "Publishing doxygen. \n"

	rm -rf $HOME/out || exit 0;
	mkdir $HOME/out; 
	( 	cd $HOME/out	
		cp -R $PROJ_ROOT/doc/html ./html

		git config --global user.email "travis@travis-ci.org"
		git config --global user.name "travis-ci"
		git add .
		git commit -m "Deployed to Github Pages"
		git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

		echo -e "Published doxygen to gh-pages. \n"
	)

fi
