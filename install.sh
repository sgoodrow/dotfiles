#!/bin/bash

BASEDIR=$PWD

function symlink() {
	ln -sf ${PWD}/${1} ~/.${1}
}

cd $BASEDIR/src
for i in $( ls $PWD ); do
    symlink $i
done

git submodule init
git submodule update
cd $BASEDIR/gitalias
symlink gitalias.txt
