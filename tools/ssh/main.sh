myssh (){
    case $1 in
        ("start")
            if [ $ISMAC -eq 1 ]; then
                sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
            elif [ $ISLINUX -eq 1 ]; then
                service sshd start
            fi
            ;;
        ("stop")
            if [ $ISMAC -eq 1 ]; then
                sudo launchctl unload -w /System/Library/LaunchDaemons/ssh.plist
            elif [ $ISLINUX -eq 1 ]; then
                service sshd stop
            fi
            ;;
        ("ls")
            nmap localhost | grep ssh
            ;;
        (*)
            which sshh ;;
    esac
}

