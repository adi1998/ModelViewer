cat $PSScriptRoot
cd $PSScriptRoot
deppth2 hpk -s $PSScriptRoot -t ($PSScriptRoot + "/zerp-ModelViewer") > temp.log
cat temp.log