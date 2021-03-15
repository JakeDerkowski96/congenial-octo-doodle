#!/bin/bash
# make the terminal how i like it

cd $HOME
cp .bashrc .bashrc.bak
wget https://raw.githubusercontent.com/JakeDerkowski96/congenial-octo-doodle/uno/bash/terminal-profile
mv terminal-profile .bashrc
source .bashrc
