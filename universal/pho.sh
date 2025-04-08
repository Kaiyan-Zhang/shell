pho (){
    case $1 in
        ("ls") adb devices ;; # 展示所有设备
        ("which") adb shell am monitor ;; # 显示包名
        ("locate") adb shell pm path $2 ;; # 展示包位置
        ("install") adb install $2 ;; # 安装软件
        ("uninstall") adb shell pm uninstall --user 0 $2 ;; # 卸载软件
        ("cast") scrcpy ;; # 开始投屏
        ("connect") adb connect "$2:$3" ;; # WIFI连接
        ("click") adb shell input tap $2 $3 ;; # 点击($2,$3)
        ("strong-click") adb shell input press $2 $3 && adb shell input press $2 $3 ;;
        ("swipe") adb shell input swipe $2 $3 $4 $5 ;; # 从($2,$3)滑动到($4,$5)
        ("upload") adb push $2 /sdcard/$3 ;; # 把$2上传到手机根目录$3的位置
        ("download") adb pull /sdcard/$2 ;; # 将手机上$2位置的文件下载到当前文件夹
        (*) which pho ;;
    esac
}