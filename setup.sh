echo "Installing Homebrew."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

echo "Installing system tools."
brew install zsh
brew install tmux

echo "Installing oh-my-zsh."
sh -c “$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

echo "Installing core tools."
brew install node


echo "Installing 3rd party applications."
export HOMEBREW_CASK_OPTS="--appdir=/Applications" # This sets the default installation directory for cask installed apps.

brew cask install spotify
brew cask install iterm2
