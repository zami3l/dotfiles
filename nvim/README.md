# Neovim

```
$ pacman -S neovim-git
```

Plugins manager
```
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install plugins in VIM
```vim
:PluginInstall
```

Location file : ~/.config/nvim/

