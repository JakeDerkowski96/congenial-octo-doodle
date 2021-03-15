#!/bin/bash 
# script to run to build a latex builder machine

apt update
# to download the resume directory from githhub
apt install git




function git-resume { git clone https://github.com/JakeDerkowski96/Resume.git; }

function download-latex {
	apt-get install texlive
	apt-get install texlive-base
	apt-get install biblatex
	apt-get install texlive-fonts-recommended
	apt-get install texlive-fonts-extra
	apt-get install texlive-xetex

}