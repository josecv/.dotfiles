DOTFILES=$HOME/.dotfiles

# Powerlevel9K config
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CUSTOM_FAST_GIT="jose::fast_git"
POWERLEVEL9K_CUSTOM_FAST_GIT_BACKGROUND="green"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context kubecontext custom_fast_git virtualenv newline dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs todo time)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-aheadbehind git-tagname)

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Sadly Au uses a helm version too old for the oh-my-zsh plugin to work with it
zplug "robbyrussell/oh-my-zsh", use:oh-my-zsh.sh
DISABLE_AUTO_UPDATE=true

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/kops", from:oh-my-zsh

zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-autosuggestions"
zplug "rupa/z", use:z.sh

zplug "$DOTFILES/fpath", from:local

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install zplug plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
   printf "Install? [y/N]: "
   if read -q; then
       echo; zplug install
   fi
fi

if [ -f "$_zplug_lock" ]; then
    rm "$_zplug_lock"
fi

zplug load

. $HOME/.private_zshrc
. $DOTFILES/fun.zsh

bindkey -v
bindkey -M vicmd "^V" edit-command-line
bindkey '^ ' autosuggest-accept

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
#These two are used to prevent tmux panes from sharing history.
setopt noincappendhistory
setopt nosharehistory

alias mrn="MAVEN_OPTS='-Dspring.profiles.active=local-dev,disable-auth' mvn spring-boot:run"
alias kgpg='k get pods | grep'
alias kgpwg='k get pods -w | grep'
alias gap="git add -p"
alias norg='gron --ungron'
