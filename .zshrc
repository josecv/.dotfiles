DOTFILES=$HOME/.dotfiles

# Powerlevel9K config
PATH="$PATH:$HOME/.local/bin"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CUSTOM_FAST_GIT="jose::fast_git"
POWERLEVEL9K_CUSTOM_FAST_GIT_BACKGROUND="green"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context kubecontext custom_fast_git virtualenv newline dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-aheadbehind git-tagname)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "robbyrussell/oh-my-zsh", use:oh-my-zsh.sh
DISABLE_AUTO_UPDATE=true

if [[ $(uname) == 'Darwin' ]]; then
    zplug "plugins/osx", from:oh-my-zsh
    zplug "plugins/brew", from:oh-my-zsh
fi

zplug "plugins/git", from:oh-my-zsh
#zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/kops", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh

if [[ "$DISABLE_ALI" != 'true' ]]; then
    zplug "aliyun/aliyun-cli", from:gh-r, as:command, rename-to:aliyun
fi

zplug "MichaelAquilina/zsh-you-should-use"
zplug "zsh-users/zsh-autosuggestions"
zplug "rupa/z", use:z.sh

if ! [[ -f /usr/local/bin/yq ]]; then
    zplug "mikefarah/yq", as:command, from:gh-r, rename-to:yq
fi
if ! [[ -f /usr/local/bin/stern ]]; then
    zplug "wercker/stern", as:command, from:gh-r, rename-to:stern
fi
if ! [[ -f /usr/local/bin/fd ]]; then
    zplug "sharkdp/fd", as:command, from:gh-r, rename-to:fd
fi
if ! [[ -f /usr/local/bin/bat ]]; then
    zplug "sharkdp/bat", as:command, from:gh-r, rename-to:bat, use:"*x86_64*linux-gnu*"
fi
if ! [[ -f /usr/local/bin/fzf ]]; then
    zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux_amd64*"
fi

zplug "$DOTFILES/fpath", from:local

if [[ $(uname -m) == 'x86_64' && -z "$DISABLE_PL9K" ]]; then
    zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, at:v0.6.4
else
    zplug mafredri/zsh-async, from:github
    zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
fi

zplug "zsh-users/zsh-syntax-highlighting", defer:2

if [[ -f $HOME/.private_zsh_plugins ]]; then
    . $HOME/.private_zsh_plugins
fi

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

if [[ -f "$HOME/.private_zshrc" ]]; then
    . $HOME/.private_zshrc
fi
. $DOTFILES/fun.zsh

bindkey -v
bindkey -M vicmd "^V" edit-command-line
bindkey '^ ' autosuggest-accept

if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
#These two are used to prevent tmux panes from sharing history.
setopt noincappendhistory
setopt nosharehistory
export EDITOR=vim
export VISUAL=vim

alias mrn="MAVEN_OPTS='-Dspring.profiles.active=local-dev,disable-auth' mvn spring-boot:run"
alias kgpg='k get pods | grep'
alias kgpwg='k get pods -w | grep'
alias gap="git add -p"
alias gpf='git push -f'
alias norg='gron --ungron'
alias kc='k'
alias pbld='python setup.py build && python setup.py install'
alias kgpa='k get pods -a'
unalias kcp

function kcmk {
    _switch_context minikube $1
}

if ! which pbpaste 2>&1 > /dev/null; then
    alias pbpaste='xclip -selection clipboard -o'
fi

if ! which pbcopy 2>&1 > /dev/null; then
    alias pbcopy='xclip -selection clipboard'
fi

if [[ -f /usr/local/share/zsh/site-functions/_kubectl ]]; then
    # for some reason this needs to be the last line here, or k8s autocompletion
    # breaks down
    source /usr/local/share/zsh/site-functions/_kubectl
fi
