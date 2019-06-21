#!/bin/bash

BASEDIR=$PWD

function symlink() {
	ln -sf ${PWD}/${1} ~/.${2}
}

cd $BASEDIR/src
for i in $( ls $PWD ); do
    symlink $i $i
done

git submodule init
git submodule update

# symlink gitalias
cd $BASEDIR/gitalias
symlink gitalias.txt gitalias.txt

# symlink maven-bash-completion
cd $BASEDIR/maven-bash-completion
symlink bash_completion.bash maven_bash_completion.bash