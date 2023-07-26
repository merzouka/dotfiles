#!/bin/bash


cd $HOME/.config/i3/colorschemes/

if [[ ! -e $1 || "$1" == "" ]]; then
    echo "invalid theme"
    exit 1
fi 

theme=$1

cat $theme assignment.conf > ../colors.conf
