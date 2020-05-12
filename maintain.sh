#'
sure_root(){
    if ! [ -d "$HOME/.newcontinent-team.com" ]; then 
        mkdir -p "$HOME/.newcontinent-team.com"
    fi
}
sure_root_script(){
    if ! [ -f "$HOME/.newcontinent-team.com/main.sh" ]; then 
        touch "$HOME/.newcontinent-team.com/main.sh"
    fi

    bash_profile_content=$(<$HOME/.bash_profile)

    if ! [ "$bash_profile_content" != "${bash_profile_content/source ~\/.newcontinent-team.com\/main.sh/}" ]; then
        echo "source $HOME/.newcontinent-team.com/main.sh" | tee -a ~/.bash_profile
    fi
}

sure_alter_to_root_script(){
    main_content=$(<$HOME/.newcontinent-team.com/main.sh)
    #find_content=$("source ")
    if ! [ "$main_content" != "${main_content/source $HOME\/.newcontinent-team.com\/kube\/kube.sh/}" ]; then
        echo "source $HOME/.newcontinent-team.com/kube/kube.sh" | tee -a ~/.newcontinent-team.com/main.sh
    fi
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$#" -ne 0 ]; then
    action=$1
else 
    action="install"
fi

if [ $action = 'uninstall' ]; then 
    echo "uninstall"
else
    sure_root
    sure_root_script
    mkdir -p $HOME/.newcontinent-team.com/kube
    cp -R $DIR/scripts/ $HOME/.newcontinent-team.com/kube/
    chmod -R +x  $HOME/.newcontinent-team.com
    sure_alter_to_root_script
fi

