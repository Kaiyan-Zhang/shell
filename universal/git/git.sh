g(){
    case $1 in
        ("a")
            # echo "添加一个branch"
            git switch -c $2 &&
            git push --no-verify --set-upstream origin $2
            ;;
        ("d")
            # echo "删除一个branch"
            DEFAULT_VALUE=`git branch --show-current`
            TARGET_BRANCH="${2:-$DEFAULT_VALUE}"
            git switch $(git remote show origin | sed -n '/HEAD branch/s/.*: //p') &&
            git branch -d ${TARGET_BRANCH} &&
            git push origin --delete ${TARGET_BRANCH} &&
            git remote update origin --prune
            ;;
        ("r")
            # echo "清空本地修改"
            git add . &&
            git reset --hard &&
            git clean -f &&
            git submodule update --
            ;;
        ("p") 
            # echo "同步到远程"
            git add .
            git commit
            git push
            ;;
        ("m") 
            # echo "commit中"
            git add .
            git commit
            ;;
        ("b")
            # echo "所有分支"
            git branch # --all
            ;;
        ("s")
            # echo "切换分支"
            if [ -z "$2" ]; then 
                # 如果没有$2，则退出
                # -z 表示字符串长度为0，即空串
                return
            fi
            git switch $2 &&
            g r &&
            git fetch
            ;;
        ("S")
            # fzf切换分支
            # sk是fzf的rust升级版
            g s $(g b | sk)
            ;;
        ("f")
            # echo "强推到远程"
            git add . &&
            git commit --amend --no-edit &&
            git push origin --no-verify -f
            ;;
        ("g")
            # echo "获取url"
            git config --get remote.origin.url
            ;;
        ("c")
            # echo "清除无效远程分支"
            git remote update origin --prune
            git pull
            ;;
        ("l")
            # echo "清除本地无效分支"
            git branch -vv | grep ': 丢失]' |  grep -v "\*" | awk '{ print $1; }' | xargs git branch -D
            git branch -vv | grep ': gone]' |  grep -v "\*" | awk '{ print $1; }' | xargs git branch -D
            ;;
        (*)
            which g
            ;;
    esac
}

