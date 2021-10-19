# My dotfiles

To install:

```bash
# Save old configs
mv ~/.vim ~/.vim.old
mv ~/.config/nvim ~/.config/nvim-old

cd ~

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

# Tmux config
```bash
ln -s ~/dotfiles/.tmux ~/
ln -s ~/dotfiles/.tmux.conf ~/
ln -s ~/dotfiles/.tmux.conf.local ~/
```

# Alacritty

If using Alacritty as your terminal - install terminfo:
```
curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info > /tmp/alacritty.info
tic -x /tmp/alacritty.info
```
