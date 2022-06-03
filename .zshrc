if [[ $(uname -s) == 'Darwin' ]] && [[ $(uname -m) == 'arm64' ]]; then
  #  if M1 mac then use the following
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH=$(brew --prefix)/bin:$PATH
  export PATH=$(brew --prefix)/sbin:$PATH
fi

# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
# export ZSH="~/maxjerin/.oh-my-zsh"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# History file settings
SAVEHIST=500  # Save most-recent 500 lines
HISTSIZE=500
HISTFILE=~/.zsh_history

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-abbr)
# plugins=(git zsh-completions)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Newline after terminal
# prompt_end() {
#  if [[ -n $CURRENT_BG ]]; then
#      print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
#  else
#      print -n "%{%k%}"
#  fi
#
#  print -n "%{%f%}"
#  CURRENT_BG=''
#
#  #Adds the new line and ➜ as the start character.
#  printf "\n ➜";
#}

# For compilers to find zlib you may need to set:
# export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
# export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

# export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/


# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/maxjerin/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/maxjerin/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/maxjerin/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/maxjerin/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# MacOSX
# export CPATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include
# export CPATH=`xcrun --show-sdk-path`/usr/include


ZSH_PATH="~/.zsh"
if [[ $(uname -s) == 'Darwin' ]]; then
  if type brew &>/dev/null; then
    function load_path() {
      source $(brew --prefix)/share/$1/$1.zsh
    }
    load_path "zsh-autosuggestions"
    load_path "zsh-abbr"
    load_path "zsh-syntax-highlighting"
    source $(brew --prefix)/etc/profile.d/z.sh
    source $(brew --prefix)/share/zsh/site-functions/prompt_spaceship_setup

    # Fuzzy finder
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  fi
else
  # Fuzzy finder
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # Autosuggest
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

  # Abbreviation
  source ~/.zsh/zsh-abbr/zsh-abbr.zsh

  # Syntax highlighting
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # Autocomplete
  source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
fi

# PyEnv
export PATH=$PATH:$HOME/.pyenv/bin
eval "$(pyenv init -)"

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# Bazel
export PATH=${HOME}/bin:$PATH
# source ${HOME}/.bazel/bin/bazel-complete.bash

# Powerline Go Setup
: '
if [[ $(uname -s) == 'Darwin' ]]; then
  export PATH=$PATH:$(brew --prefix)/bin
  POWERLINE_GO=$(brew --prefix)/bin/powerline-go

  function powerline_precmd() {
    PS1="$($POWERLINE_GO -error $? -jobs ${${(%):%j}:-0})"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
  }

  function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
      if [ "$s" = "powerline_precmd" ]; then
        return
      fi
    done
    precmd_functions+=(powerline_precmd)
  }

  if [ "$TERM" != "linux" ] && [ -f "$POWERLINE_GO" ]; then
    install_powerline_precmd
  fi
fi
: '

# WORK ZSHRC
if test -f ~/.zshrc_company; then
  source ~/.zshrc_company
fi

# 1Password Agent Link
if test -f ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock; then
  mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
fi

# Remove all duplicates from $PATH
typeset -U PATH

autoload -U compinit && compinit
zstyle ':completion:*' menu select
