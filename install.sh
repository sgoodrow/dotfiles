#!/bin/bash
DIR=$PWD
cd ~
for i in $( ls $DIR/dots ); do
    ln -sf $DIR/dots/$i .$i
    echo "Created symlink ${PWD}/.${i} -> ${DIR}/dots/${i}"
done
cd -
