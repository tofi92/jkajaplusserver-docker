#!/bin/bash

if [ `ls -1 assets/assets*.pk3 2>/dev/null | wc -l ` -gt 0 ]; then
    cp assets/assets{0,1,2,3}.pk3 base/;
else
    echo "Error: All 4 .pk3 files must be present!";
    exit 2;
fi


if test -f "japluscfg/server.cfg"; then
    rm japlus/server.cfg;
    cp japluscfg/server.cfg japlus/server.cfg;
fi
/bin/bash ./start_japlus_linux_autoRestart.sh;

