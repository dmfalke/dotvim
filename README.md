# Installation

    git clone git@github.com:dmfalke/dotvim.git ~/.vim

# Create symlinks

## Vim

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

## Neovim

    ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
    ln -s ~/.vim/pack ~/.local/share/nvim/site/pack

# Install package submodules

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

# Add a new package as a submodule

    cd ~/.vim
    git submodule add <URL-for-git-repository> pack/submodules/start/<plugin-name>
    git add pack/submodules/start/<plugin-name>
    git commit -m "Added package submodule"

