DOTFILES=$HOME/.dotfiles

# Powerlevel9K config
POWERLEVEL9K_CUSTOM_FAST_GIT="jose::fast_git"
POWERLEVEL9K_CUSTOM_FAST_GIT_BACKGROUND="green"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context kubecontext custom_fast_git virtualenv newline dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs todo time)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-aheadbehind git-tagname)

source <(antibody init)

# Sadly Au uses a helm version too old for the oh-my-zsh plugin to work with it
antibody bundle robbyrussell/oh-my-zsh
antibody bundle robbyrussell/oh-my-zsh folder:plugins/git
antibody bundle robbyrussell/oh-my-zsh folder:plugins/osx
antibody bundle robbyrussell/oh-my-zsh folder:plugins/aws
antibody bundle robbyrussell/oh-my-zsh folder:plugins/brew
antibody bundle robbyrussell/oh-my-zsh folder:plugins/docker
antibody bundle robbyrussell/oh-my-zsh folder:plugins/github
antibody bundle robbyrussell/oh-my-zsh folder:plugins/mvn
antibody bundle robbyrussell/oh-my-zsh folder:plugins/kubectl
antibody bundle robbyrussell/oh-my-zsh folder:plugins/python
antibody bundle robbyrussell/oh-my-zsh folder:plugins/pip
antibody bundle robbyrussell/oh-my-zsh folder:plugins/tmux

antibody bundle MichaelAquilina/zsh-you-should-use

antibody bundle bhilburn/powerlevel9k

antibody bundle zsh-users/zsh-syntax-highlighting

. $HOME/.private_zshrc
. $DOTFILES/fun.zsh

bindkey -v
bindkey -M vicmd "^V" edit-command-line

setopt noincappendhistory
setopt nosharehistory

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

alias mrn="MAVEN_OPTS='-Dspring.profiles.active=local-dev,disable-auth' mvn spring-boot:run"
alias kgpg='k get pods | grep'
alias kgpwg='k get pods -w | grep'
