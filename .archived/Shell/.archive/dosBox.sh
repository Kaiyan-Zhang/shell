if [ $ISMAC -eq 1 ]; then
    # export $dos = ...?
    export dos_install=/Applications/dosbox.app/Contents
    export dos_config=~/Library/Preferences/DOSBox\ 0.74-3-3\ Preferences
    alias box='$dos_install/MacOS/DOSBox $dos'
fi

if [ $ISWSL -eq 1 ]; then
    export dos_install=/mnt/c/DOSBox
    export dos_config=/mnt/c/Users/zhang/AppData/Local/DOSBox
    export dos_config=~/.dosbox/dosbox-0.74-3.conf
    alias box='$dos_install/DOSBox.exe -noconsole -userconf'
fi
