# !/bin/zsh
# Replace .vimrc, .gitconfig and config files for zsh
# You should backup these files before

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# For prezto, you need to clone submodule recursively
ln -s ~/dotfiles/prezto/ ~/.zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
