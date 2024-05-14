#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a projects directories
mkdir $HOME/Code
mkdir $HOME/Herd

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer
# /usr/local/bin/composer global require laravel/valet beyondcode/expose

# Install Laravel Valet
# $HOME/.composer/vendor/bin/valet install

# Install Global Ray - haven't purchased it yet
# $HOME/.composer/vendor/bin/global-ray install

# Create a Sites directory
mkdir $HOME/code

# Create sites subdirectories
## work
mkdir $HOME/code/programmatic
mkdir $HOME/code/cm
mkdir $HOME/code/crm
mkdir $HOME/code/ams
mkdir $HOME/code/skitto

## personal
mkdir $HOME/code/swapnilsarwe
mkdir $HOME/code/codeat3
mkdir $HOME/code/blade-icons

# Clone Github repositories
./clone.sh

# Symlink the Mackup config file to the home directory
ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
