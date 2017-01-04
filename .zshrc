# Path to your oh-my-zsh installation.
export ZSH=/Users/mmscibor/.oh-my-zsh

ZSH_THEME="agnoster"

# Plugins
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration
alias clc=clear

# Additions to path and environment variables
export TERM=xterm
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

# Start up tmux on shell start
tmux
tmux source ~/.tmux.conf
clc

