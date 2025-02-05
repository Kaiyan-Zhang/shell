if [ $ISLINUX -eq 1 ]; then
    export JAVA_HOME='/usr/lib/jvm/java-14-openjdk-amd64'
    # 别名
    alias edlinux='vim ${LinuxConfig}/Shell/linux.sh'
    alias update='sudo apt update -y && sudo apt upgrade -y;'
    alias ip='ip address'
    if [ -f ~/.Xmodmap ]; then
        xmodmap ~/.Xmodmap
        # 取消鼠标中间的粘贴功能
        xmodmap -e "pointer = 1 25 3 4 5 6 7 2"
    fi
fi
