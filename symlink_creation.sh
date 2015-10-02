#!/bin/bash
EGG_FOLDERS=`ls -1d eggs/*/`
PYTHON_SITEPKG='/opt/python/Python-3.5.0-build/lib/python3.5/site-packages/.'

# ~# echo $EGG_FOLDERS
for EGG_FOLDER in $EGG_FOLDERS
do 
    TEST=`find $EGG_FOLDER -maxdepth 1`
    for TT in $TEST
    do
    if [[ "$TT" != *"EGG-INFO"* ]] && [[ "$TT" != *"__pycache__"* ]] && [[ ! "$TT" =~ .egg/$ ]] && [[ "$TT" != *"zc.buildout"* ]];then
    echo $PWD/$TT
    ln -s $PWD/$TT $PYTHON_SITEPKG
    fi
    done
done
