#!/bin/bash

if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST = "false" ]]; then
    git checkout master
    git remote add origin git@github.com:interfax/interfax-java.git
    mvn release:prepare release:perform -Darguments="-Dgpg.defaultKeyring=false -Dgpg-keyname=62E96907 -Dgpg.passphrase=$GPGKEY_PASSPHRASE -Dgpg.publicKeyring=~/pubring.gpg -Dgpg.secretKeyring=~/secring.gpg -DskipTests=true -DskipTests=true" -B -Prelease --settings ~/settings.xml
fi
