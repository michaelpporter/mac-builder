#!/usr/bin/env bash

# This is heavily inspired by the amazing Michelle, Luke and Avi
# https://github.com/craychee/loki-init
# https://github.com/lukewertz/gabriel-init
# https://github.com/froboy/durandal-init

function pause() {
  read -p "$*"
}

CWD=($PWD)

cd ~

# We can't get them directly, but just click this button :)
xcode-select --install

pause 'Press [Enter] once you have installed XCode and XCode Command Line Tools.'

# Just make sure...
sudo xcodebuild -license accept

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Homebrew
brew install ruby
brew install git
brew install wget
brew install brew-cask

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/binary
brew tap homebrew/php
brew install homebrew/php/wp-cli

# Applications
brew cask install 1password
brew cask install bartender
brew cask install docker
brew cask install firefox
brew cask install google-chrome
brew cask install google-photos-backup
brew cask install harvest
brew cask install iterm2
brew cask install omnifocus
brew cask install skitch
brew cask install skype
brew cask install slack
brew cask install tower
brew cask install sublime-text
brew cask install virtualbox
brew cask install zoomus

# Not available
# - Mac Remover
# - Pixelmator
# - Reason 8

# Installs Python, Virtualenv, and GMvault
# http://gmvault.org/
sudo easy_install pip
brew install python
pip install virtualenv
virtualenv --no-site-packages gmvault-1.7-beta
cd gmvault-1.7-beta/bin
./pip install gmvault
cd ~

# Node/NPM Tools
brew install node
brew install npm
# Easy accessibility audits powered by the Chrome Accessibility Tools
npm install --global a11y
# Minify images
npm install --global imagemin-cli
# Lighthouse analyzes web apps and web pages, collecting modern performance metrics and insights on developer best practices
npm install --global lighthouse
# Prettier is an opinionated code formatter
npm install --global prettier
# PageSpeed Insights with reporting
npm install --global psi
# Using sitespeed.io you can test your web site against Web Performance best practices
npm install --global sitespeed.io
# WebPageTest API Wrapper is a NPM package that wraps WebPageTest API for NodeJS
npm install --global webpagetest

# Get composer and put it in the right place. This will require your password
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

# Install Composer tools
# composer parallel install plugin
composer global require hirak/prestissimo
# Drupal Coder, PHP_CodeSniffer, and Drupal Coding Standards
composer global require drupal/coder
# Adds WordPress Coding Standards
composer global require wp-coding-standards/wpcs:dev-master
composer global require pantheon-systems/terminus
composer global require phpmd/phpmd
composer global require sebastian/phpcpd
composer global require consolidation/robo

# Sets Config for PHP_CodeSniffer
phpcs --config-set installed_paths $HOME/.composer/vendor/drupal/coder/coder_sniffer,$HOME/.composer/vendor/wp-coding-standards/wpcs

# Be sure we can vagrant
brew install ansible

# Set up PHP tools
# https://philsturgeon.uk/php/2013/08/20/php-static-analysis-in-sublime-text/
# http://benmatselby.github.io/sublime-phpcs/
echo "Setting up PHP Tools"
sudo chown -R $(whoami) $(brew --prefix)/*
brew tap homebrew/homebrew-php

# Do the Mac thing that you have to do but you shouldn't have to do
# This https://github.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain
curl -o ~/Library/LaunchAgents/ssh.add.a.plist https://raw.githubusercontent.com/jirsbek/SSH-keys-in-macOS-Sierra-keychain/master/ssh.add.a.plist

# Hold my own hand to make sure I finish configuring
echo "Add your ssh keys (you put them in your secret hiding place)."
pause 'Press [Enter] when you have added your ssh key.'
chmod 400 ~/.ssh/*

# Get git things
#curl -o /usr/local/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
#curl -o /usr/local/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo "NICE WORK! Time to do the things."
