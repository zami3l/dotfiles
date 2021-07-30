# Neovim

### 0. Installation
```
$ pacman -S neovim
```

### 1. Install plugins manager
```shell
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### 2. Install config
```shell
cp -r dotfiles/nvim ~/.config/
```

### 3. Install requirements deoplete
```shell
pacman -S python python-pip

pip3 install --user pynvim
```

### 4. Install plugins in nvim
```vim
:PluginInstall
```

### 5. Reload deoplete
```vim
:UpdateRemotePlugins
```
