#!/bin/bash

if [ `ls -1 /ja/assets/assets*.pk3 2>/dev/null | wc -l ` -gt 3 ]; then
    echo "The 4 .pk3 files are present";
    
    cp /ja/assets/* /ja/base;
    echo "copying assets to base directory";
else
    echo "Error: All 4 .pk3 files must be present!";
    exit 2;
fi

if [ `ls -1 /ja/base/cgamei386.so | wc -l ` -lt 1 ]; then
    cp /ja/base_original/cgamei386.so /ja/base/cgamei386.so;
    echo "copying cgamei386.so to base directory";
fi

if [ `ls -1 /ja/base/jampgamei386.so | wc -l ` -lt 1 ]; then
    cp /ja/base_original/jampgamei386.so /ja/base/jampgamei386.so;
    echo "copying jampgamei386.so to base directory";
fi

if [ `ls -1 /ja/base/uii386.so | wc -l ` -lt 1 ]; then
    cp /ja/base_original/uii386.so /ja/base/uii386.so;
    echo "copying uii386.so to base directory";
fi


if test -f "japluscfg/server.cfg"; then
    rm japlus/server.cfg;
    cp japluscfg/server.cfg japlus/server.cfg;
fi
/bin/bash ./start_japlus_linux_autoRestart.sh;