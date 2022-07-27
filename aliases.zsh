## generic
alias h="cd ~/" # Go home
alias ehosts="sudo vim /etc/hosts"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias codetree="cd ~/code && tree -L 3"
alias octal="stat -f '%A %a %N'"
alias pyser="python -m SimpleHTTPServer"

# Shortcuts
# alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
# alias reloadshell="source $HOME/.zshrc"
# alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"
# alias compile="commit 'compile'"
# alias version="commit 'version'"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias dev="cd $HOME/code"
# alias lara="sites && cd laravel/"
# alias docs="lara && cd docs/"

## composer
alias cu='composer update'
alias cui='composer update --ignore-platform-reqs'
alias ci='composer install'
alias cii='composer install --ignore-platform-reqs'
alias cr='composer require'
alias cda='composer dump-autoload'
alias cf='composer format'
alias ct='composer test'

## git
alias gi='git add -A && git commit -m'
alias wip="git add . && git commit -m 'wip'"
alias wipupg="git add . && git commit -m 'laravel upgrade'"
alias nah="git reset --hard && git clean -df"
alias upds="git add . && git commit -m 'updates'"

# Laravel
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
alias seed="php artisan db:seed"
alias serve="php artisan serve"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="php -d memory_limit=-1 /opt/homebrew/bin/composer"

## php
phpv() {
    valet stop
    brew unlink php@7.3 php@7.4 php@8.0 php@8.1
    brew link --force --overwrite $1
    brew services start $1
    composer global update
	rm -f ~/.config/valet/valet.sock
    valet install
}
alias php73="phpv php@7.3"
alias php74="phpv php@7.4"
alias php80="phpv php@8.0"
alias php81="phpv php"

## Python
alias python='python3'

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Docker
alias docker-composer="docker-compose"

# SQL Server
alias mssql="docker run -e ACCEPT_EULA=Y -e SA_PASSWORD=LaravelWow1986! -p 1433:1433 mcr.microsoft.com/mssql/server:2017-latest"

# Git
# alias gst="git status"
# alias gb="git branch"
# alias gc="git checkout"
# alias gl="git log --oneline --decorate --color"
# alias amend="git add . && git commit --amend --no-edit"
# alias commit="git add . && git commit -m"
# alias diff="git diff"
# alias force="git push --force"
# alias nuke="git clean -df && git reset --hard"
# alias pop="git stash pop"
# alias pull="git pull"
# alias push="git push"
# alias resolve="git add . && git commit --no-edit"
# alias stash="git stash -u"
# alias unstage="git restore --staged ."
# alias wip="commit wip"
