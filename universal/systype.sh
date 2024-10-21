export WINHOME="/mnt/c/Users/zhang"
export ISWINDOWS=0
if [ -e $WINHOME ]; then ISWINDOWS=1; fi
export ISMAC=0
if [ $(uname) = Darwin ]; then ISMAC=1; fi
export ISLINUX=0
if [ $(uname) = Linux ]; then ISLINUX=1; fi
export ISWSL=0
if [ $ISWINDOWS -eq 1 -a $ISLINUX -eq 1 ]; then ISWSL=1; fi