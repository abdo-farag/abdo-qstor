#! /usr/local/bin/zsh
if [ $# -lt 1 ]
then
  echo "diskname argument not specified!"
  exit
fi
Device=$1;
output=`./jsonthis6.sh $Device | awk -F '[}{]' '{printf",{%s}]",$6}'`
#end=`sed "s/[}]]/$output/" add.log `
end=`sed "s/]/$output/" add.log`
echo $end > add.log
#s/}{/,/g
