if [ $ISWSL -eq 1 ]; then
    export down=$WINHOME/Downloads
    export desk=$WINHOME/Desktop
    export APPDATA=/mnt/c/Users/zhang/AppData/Roaming
    alias windows='explorer.exe .'
else
    export down=~/Downloads 
    export desk=~/Desktop
    alias ubuntu="docker exec -it ubuntu_container zsh"
fi