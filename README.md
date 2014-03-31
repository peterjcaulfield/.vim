##Vim environment

Bundles are managed with pathogen and are installed as submodules. 

###Adding new submodules

```
cd ~/.vim
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Installing fugitive as submodule."
```

###Installing this Vim environment on another machine
``` 
cd ~
git clone http://github.com/peterjcaulfield/.vim.git
ln -s ~/.vim/.vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

###Upgrading a plugin bundle
```
cd ~/.vim/bundle/fugitive
git pull origin master
```

###upgrading all plugin bundles
```
git submodule foreach fit pull origin master
```


