#!/bin/bash

#
# Copyright (C) 2016 JohnnieMac <john@appyappster.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is furnished
# to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

set -e
	
VERSION=1.0.0

info() {
     local green="\033[1;32m"
     local normal="\033[0m"
     echo -e "[${green}INFO${normal}] $1"
}

error() {
     local red="\033[1;31m"
     local normal="\033[0m"
     echo -e "[${red}ERROR${normal}] $1"
}

usage() {
cat << EOF
VERSION: $VERSION
USAGE:
    $0 srcfile dstpath

DESCRIPTION:
    This script is for generating app icons and is designed to be easily expandable when new sizes are added.
    srcfile - The source png image. Preferably above 1024x1024
    Based on a script created by Wenva <lvyexuwenfa100@126.com>

 
    This script is depend on ImageMagick. So you must install ImageMagick first
 
AUTHOR:
    JohnnieMac<john@appyappster.com>

LICENSE:
    This script follow MIT license.

EXAMPLE:
    $0 1024.png 
EOF
}

# Check ImageMagick
command -v convert >/dev/null 2>&1 || { error >&2 "The ImageMagick is not installed. You need to install it first."; exit -1; }

# Check param
if [ $# != 1 ];then
    usage
    exit -1
fi


SRC_FILE="$1"

filename=$(echo $SRC_FILE | cut -f 1 -d '.')


SIZE[0]="20x20"
SIZE[1]="40x40"
SIZE[2]="29x29"
SIZE[3]="58x58"
SIZE[4]="87x87"
SIZE[5]="40x40"
SIZE[6]="80x80"
SIZE[7]="120x120"
SIZE[8]="57x57"
SIZE[9]="114x114"
SIZE[10]="60x60"
SIZE[11]="120x120"
SIZE[12]="180x180"
SIZE[13]="72x72"
SIZE[14]="144x144"
SIZE[15]="76x76"
SIZE[16]="152x152"
SIZE[17]="228x228"
SIZE[18]="167x167"
SIZE[19]="50x50"
SIZE[20]="100x100"



NAMEPOSTFIX[0]="20x20@2x"
NAMEPOSTFIX[1]="20x20@3x"
NAMEPOSTFIX[2]="29x29@1x"
NAMEPOSTFIX[3]="29x29@2x"
NAMEPOSTFIX[4]="29x29@3x"
NAMEPOSTFIX[5]="40x40@1x"
NAMEPOSTFIX[6]="40x40@2x"
NAMEPOSTFIX[7]="40x40@3x"
NAMEPOSTFIX[8]="57x57@1x"
NAMEPOSTFIX[9]="57x57@2x"
NAMEPOSTFIX[10]="60x60@1x"
NAMEPOSTFIX[11]="60x60@2x"
NAMEPOSTFIX[12]="60x60@3x"
NAMEPOSTFIX[13]="72x72@1x"
NAMEPOSTFIX[14]="72x72@2x"
NAMEPOSTFIX[15]="76x76@1x"
NAMEPOSTFIX[16]="76x76@2x"
NAMEPOSTFIX[17]="76x76@3x"
NAMEPOSTFIX[18]="83.5x83.5@2x"
NAMEPOSTFIX[19]="50x50@1x"
NAMEPOSTFIX[20]="50x50@2x"

for i in {0..20}
do
	infox="Working on $filename-${NAMEPOSTFIX[$i]}.png"
	info "$infox"
   cmdStr="convert $SRC_FILE -resize ${SIZE[$i]} $filename-${NAMEPOSTFIX[$i]}.png"
   #echo $cmdStr
   eval $cmdStr
done

info 'Hopefully thats it Done.'

