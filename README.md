# My dotfiles

To install:

```bash
cd ~/
mkdir -p ~/.config/nvim

# Save old configs
mv .vim .vim.old
mv .config/nvim .config/nvim-old

git clone https://github.com/klivan/dotfiles
ln -s ~/dotfiles/.vim .
ln -s ~/dotfiles/.config/nvim ~/.config/nvim

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Now open `vim` (I have an alias `alias vim='nvim'` and install plugins and CoC Dependencies:
```
:PluginInstall
:CocInstall coc-python coc-go coc-json
```