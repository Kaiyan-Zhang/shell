pho (){
    case $1 in
        ("ls") adb devices ;;
        ("which") adb shell am monitor ;;
        ("locate") adb shell pm path $2 ;;
        #("install") adb shell install --user 0 $2 ;;
        ("install") adb install $2 ;;
        ("uninstall") adb shell pm uninstall --user 0 $2 ;;
        (*) which pho ;;
    esac
}