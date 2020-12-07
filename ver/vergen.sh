#!/bin/sh

declare -r input=$1   #patch
declare -r output=$2  #inc/version.h

echo
echo "$0     : Version Generator"
echo "input  : " $input
echo "output : " $output


if [[ x$output == x"" ]] || [[ x$input == x"" ]] || [ ! -r $input ] #   || [ ! -w $output ]
then
    echo "ERROR : Invalip Parameter"
    echo "Usage : "
    echo "$ ./vergen.sh patch inc/version.h"
    exit -1
fi

declare -ir major=1
declare -ir minor=5

declare -ir patch="$(cat $input)+1"
declare -r vercmd="git describe --tags --long"
declare -r verstr="version-`$vercmd`"

echo $patch 1> $input

echo "major  : $major"
echo "minor  : $minor"
echo "patch  : $patch"
echo "verstr : $verstr"
echo "input  : $input"
echo "output : $output"
echo

echo                                                          >  $output
echo "/*"                                                     >> $output
echo "  This is an auto-generated include file."              >> $output
echo "*/"                                                     >> $output
echo                                                          >> $output
echo "#ifndef __VERSION_H__"                                  >> $output
echo "#define __VERSION_H__"                                  >> $output
echo ""                                                       >> $output
echo "constexpr   int     VER_MAJOR      = $major;"           >> $output
echo "constexpr   int     VER_MINOR      = $minor;"           >> $output
echo "constexpr   int     VER_PATCH      = $patch;"           >> $output
echo ""                                                       >> $output
echo "// $vercmd"                                             >> $output
echo "constexpr   char    VER_STRING[]   = \"$verstr\";"      >> $output
echo ""                                                       >> $output
echo "#endif /*__VERSION_H__*/"                               >> $output
echo                                                          >> $output

