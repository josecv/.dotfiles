DOTFILES=$HOME/.dotfiles

# Powerlevel9K config
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_CUSTOM_FAST_GIT="jose::fast_git"
POWERLEVEL9K_CUSTOM_FAST_GIT_BACKGROUND="green"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context kubecontext custom_fast_git virtualenv newline dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs todo time)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-aheadbehind git-tagname)

. $DOTFILES/antigen.zsh
antigen use oh-my-zsh

# Sadly Au uses a helm version too old for the oh-my-zsh plugin to work with it
antigen bundle git
antigen bundle osx
antigen bundle aws
antigen bundle brew
antigen bundle docker
antigen bundle github
antigen bundle mvn
antigen bundle kubectl
antigen bundle python
antigen bundle tmux

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

. $HOME/.private_zshrc
. $DOTFILES/fun.zsh

bindkey -v
bindkey -M vicmd "^V" edit-command-line

setopt noincappendhistory
setopt nosharehistory

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

alias mrn="MAVEN_OPTS='-Dspring.profiles.active=local-dev,disable-auth' mvn spring-boot:run"
alias kgpg='k get pods | grep'
