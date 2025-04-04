g(){
    # -z 表示字符串长度为0，即空串
    case $1 in
        ("a")
            # echo "添加一个branch"
            if [ -z "$2" ]; then
                return
            fi
            git switch -c $2 &&
            git push --set-upstream origin $2
            ;;
        ("_get_current_branch_name")
            # echo "查看当前分支"
            git branch --show-current
            ;;
        ("_get_main_branch_name")
            # echo "获取主分支名称"
            # 不一定是master，也可能是main
            git symbolic-ref refs/remotes/origin/HEAD | sed 's@.*/@@' # 本地版，不需要联网
            # git remote show origin | sed -n '/HEAD branch/s/.*: //p' # 远程版，需要联网
            ;;
        ("_get_other_branch_names")
            # 带有*的是当前分支
            git branch | sed 's/^[ \t]*//' | grep -v '\*'
            ;;
        ("_get_branch_names")
            # 基于_get_other_branch_names，拼接当前分支名称
            echo "$(g _get_current_branch_name)"$'\n'"$(g _get_other_branch_names)"
            ;;
        ("_select_other_branch_name")
            # 用xargs是为了去除开头的空格
            # echo -n可以去除末尾的换行符
            g _get_other_branch_names | sk | xargs echo -n
            ;;
        ("_switch_to_target_branch")
            if [ -z "$2" ]; then
                return
            fi
            git switch $2 &&
            git fetch # 追加git fetch命令，获取分支最新情况
            ;;
        ("_switch_to_main_branch")
            # 切换到主分支
            g _switch_to_target_branch $(g _get_main_branch_name)
            ;;
        ("_switch_to_other_branch_fzf")
            # echo "fzf切换分支"
            # 只能切换到其他分支
            g _switch_to_target_branch $(g _select_other_branch_name)
            ;;
        ("_delete_target_branch")
            # echo "删除指定分支，会连带远程分支一起删除"
            if [ -z "$2" ]; then
                return
            fi
            TARGET_BRANCH=$2
            git branch -D ${TARGET_BRANCH} && # 使用-D参数强制删除，避免提示报错
            git push origin --delete ${TARGET_BRANCH} &&
            git remote update origin --prune
            ;;
        ("_delete_current_branch")
            # echo "删除当前分支"
            CURRENT_BRANCH_NAME=$(g _get_current_branch_name) # 先获取当前分支，否则到时候就获取不到了
            g _switch_to_main_branch &&  # 先切换到主分支，因为不能删除当前分支
            g _delete_target_branch $CURRENT_BRANCH_NAME
            ;;
        ("_delete_branch_fzf")
            # echo "fzf删除分支"
            # 默认只能删除其他分支，如果想要删除当前分支，应该用_delete_current_branch
            g _delete_target_branch $(g _select_other_branch_name)
            ;;
        ("d")
            # 如果没有指定分支，则使用fzf选择分支
            # 如果有指定分支，则删除指定分支
            if [ -z "$2" ]; then
                g _delete_branch_fzf
            else
                g _delete_target_branch $2
            fi
            ;;
        ("D")
            # 删除当前分支
            g _delete_current_branch
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
        ("B")
            # 展示所有分支，并通过fzf选中分支，最后复制分支名称
            g _get_branch_names | sk | xargs echo -n | pbcopy
            ;;
        ("s")
            # 如果没有指定分支，则使用fzf选择分支
            # 如果有指定分支，则切换到指定分支
            if [ -z "$2" ]; then
                g _switch_to_other_branch_fzf
            else
                g _switch_to_target_branch $2
            fi
            ;;
        ("S")
            # 切换到主分支
            g _switch_to_main_branch
            ;;
        ("f")
            # echo "强推到远程"
            git add . &&
            git commit --amend --no-edit &&
            git push origin --force
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

