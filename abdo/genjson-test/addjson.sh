#! /usr/local/bin/zsh

str=${@}
oper=($(echo ${str}));
#end=`sed "s/[}]]/$output/" add.log `
#end=`sed "s/]/$oper/" add.log`
end=`sed "s/]/,$oper]/" add.log`
echo $end > add.log
