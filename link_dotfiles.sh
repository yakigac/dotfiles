# !/bin/zsh
# Replace .vimrc, .gitconfig and config files for zsh
# You should backup these files before

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

setopt EXTENDED_GLOB
for rcfile in ~/dotfiles/prezto/runcoms/^README.md(.N); do
  ln -sf ${rcfile} ~/.${rcfile:t}
done
