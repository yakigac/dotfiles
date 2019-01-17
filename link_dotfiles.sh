# !/bin/zsh
# Replace .vimrc, .gitconfig and config files for zsh
# You should backup these files before

DOTFILES=$(cd $(dirname $0); pwd)

now=$(date '+%Y%m%d%H%M%S')

cd ~/

function backup_and_link_file() {
　# すでにファイルが存在する場合はバックアップを作る
  if [[ -e $1 ]]; then
    # .zshrc_20180314010755 のような名前でバックアップをとる
    mv $1 $1_$now
  fi
  # シンボリックリンクを張る
  ln -fs $DOTFILES/$1
}

backup_and_link_file '.vimrc'
backup_and_link_file '.gitconfig'
backup_and_link_file '.tmux.conf'

# For prezto, you need to clone submodule recursively
ln -s ~/dotfiles/prezto/ ~/.zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
