#!/bin/bash
fdefault() { echo -e "\e[39m$1\e[0m"; }
fblack()   { echo -e "\e[30m$1\e[0m"; }
fred()     { echo -e "\e[31m$1\e[0m"; }
fgreen()   { echo -e "\e[32m$1\e[0m"; }
fyellow()  { echo -e "\e[33m$1\e[0m"; }
fblue()    { echo -e "\e[34m$1\e[0m"; }
fmagenta() { echo -e "\e[35m$1\e[0m"; }
fcyan()    { echo -e "\e[36m$1\e[0m"; }

bdefault() { echo -e "\e[49m$1\e[0m"; }
bblack()   { echo -e "\e[40m$1\e[0m"; }
bred()     { echo -e "\e[41m$1\e[0m"; }
bgreen()   { echo -e "\e[42m$1\e[0m"; }
byellow()  { echo -e "\e[43m$1\e[0m"; }
bblue()    { echo -e "\e[44m$1\e[0m"; }
bmagenta() { echo -e "\e[45m$1\e[0m"; }
bcyan()    { echo -e "\e[46m$1\e[0m"; }

red()     { echo -e "\e[1;30;41m$1\e[0m"; }
green()   { echo -e "\e[1;30;42m$1\e[0m"; }
yellow()  { echo -e "\e[1;30;43m$1\e[0m"; }
blue()    { echo -e "\e[1;30;44m$1\e[0m"; }
magenta() { echo -e "\e[1;30;45m$1\e[0m"; }
cyan()    { echo -e "\e[1;30;46m$1\e[0m"; }
neg()     { echo -e "\e[7$1\e[0m"; }
