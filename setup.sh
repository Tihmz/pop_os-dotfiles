#!/bin/bash

print_help () {
    echo "This script install all the dotfiles to there right place"
    echo "Use './setup --all' to install all dotfiles (zsh,tmux,kitty,vim,conky,lsd,neofetch)"
    echo "use './setup zsh' to only install zsh, './setup.sh tmux vim' to only install vim and tmux..."
}

url_zsh="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

if [ "$HOME" == "" ]; then
    user=$(whoami)
    p="/home/$user"
else
    p="$HOME"
fi

######ZSH
zsh_install () { 
    if ! [ -x "$(command -v zsh)" ]; then
        echo "installing zsh"
        sudo apt install zsh
    fi

    sh -c "$(curl -fsSL $url_zsh)"
    cp ./zsh/tihmz.zsh-theme $p/.oh-my-zsh/themes/

    if [ -f $p/.zshrc ]; then
        cp $p/.zshrc $p/.zshrc.old
    fi

    cp ./zsh/zshrc $p/.zshrc
}
######kitty
kitty_install () {
    if ! [ -x "$(command -v kitty)"]; then
        echo "downloading kitty"
        sudo apt install kitty
    fi


    if [ -d "$p/.config/kitty/" ]; then
        if [ -f "$p/.config/kitty/kitty.conf" ]; then
            cp $p/.config/kitty/kitty.conf $p/.config/kitty/kitty.conf.old
        fi
    else
        mkdir $p/.config/kitty
    fi
    
    cp kitty/kitty.conf $p/.config/kitty/
}
######neofetch
neofetch_install () {
    if ! [ -x "$(command -v neofetch)"]; then
        echo "downloading neofetch"
        sudo apt install neofetch
    fi


    if [ -d "$p/.config/neofetch/" ]; then
        if [ -f "$p/.config/neofetch/config.conf" ]; then
            cp $p/.config/neofetch/config.conf $p/.config/neofetch/config.conf.old
        fi
    else
        mkdir $p/.config/neofetch
    fi

    cp neofetch/neofetch.conf $p/.config/neofetch/config.conf
}
######vim
vim_install () {
    if ! [ -x "$(command -v vim)"]; then
        echo "downloading neofetch"
        sudo apt install vim
    fi

    if [ -f $p/.vimrc ]; then
        mv $p/.vimrc $p/.vimrc.old
    fi

    cp vim/vimrc $p/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  

    if [ "$(vim --version | grep -i +python)" != "" ]; then
        sudo apt install python3-powerline
    else
        echo "vim version doesn't support python, no powerline"
    fi
}
######conky
conky_install () {
    if ! [ -x "$(command -v conky)" ]; then
        echo "downloading conky"
        sudo apt install conky-all
    fi

    if [ -d $p/.conky ]; then
        if [ -d $p/.conky/now-clocking ]; then
            n="new-now-clocking"
        else
            n="now-clocking"
        fi
    else
        mkdir $p/.conky
    fi

    cp -r conky $p/.conky/$n
}
######tmux
tmux_install () {
    if ! [ -x "$(command -v tmux)" ]; then
        echo "downloading tmux"
        sudo apt install tmux
    fi

    if [ -f $p/.tmux.conf ]; then
        mv $p/.tmux.conf $p/.tmux.conf.old
    fi

    cp tmux/tmux.conf $p/.tmux.conf
}
######lsd
lsd_install () {
    if [ $(uname -a | grep " arm") == "" ]; then
        if ! [ -x "$(command -v lsd)" ]; then
            echo "downloading and installing lsd"
            wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
            sudo dpkg -i lsd_0.21.0_amd64.deb
        fi
    else 
        echo "arm processor, lsd install too complicated for me zZ"
    fi
}

if [ "$1" == "--all" ];then
    echo "installing everything"
    zsh_install
    lsd_install
    kitty_install
    conky_install
    tmux_install
    neofetch_install
    vim_install
elif [ "$1" == "--help" ] || [ "$1" == "-h" ] || [ "$#" == "0" ]; then
    print_help
else
    for i in "$@"
    do
        if [ "$i" == "zsh" ];then
            zsh_install
        elif [ "$i" == "kitty" ];then
            kitty_install
        elif [ "$i" == "conky" ];then
            conky_install
        elif [ "$i" == "lsd" ];then
            lsd_install
        elif [ "$i" == "neofetch" ];then
            neofetch_install
        elif [ "$i" == "tmux" ];then
            tmux_install
        elif [ "$i" == "vim" ];then
            vim_install
        else
            echo "unknow option : $i"
        fi
    done
fi



