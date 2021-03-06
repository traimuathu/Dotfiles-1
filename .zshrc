# ZSH config
# Path to your oh-my-zsh installation.
#export GTK_THEME=Adwaita:dark
export ZSH="/home/$USER/.oh-my-zsh"
export TF_FORCE_GPU_ALLOW_GROWTH=true

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

zle_highlight=('paste:none')

# Which plugins would you like to load?
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh


if [[ "$TTY" = "/dev/tty1" ]]; then
  pgrep i3 || startx
fi
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

#autoload -U colors && colors
export CLICOLOR=1
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%\c%{$fg[red]%}@%{$fg[white]%}%\m%{$fg[blue]%}]%{$reset_color%}%  %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} '
#
#

#PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] 
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] 
       [[ ${KEYMAP} == viins ]] 
       [[ ${KEYMAP} = '' ]] 
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

alias gpu_watch="watch -n -1 nvidia-smi"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias f="ranger"
alias v="nvim ."
# use this with media keys later
#alias play="spotify play"
#alias pause="spotify pause"
#alias next="spotify next"
#alias prev="spotify prev"
alias gp='git add . && git commit -m "auto push" && git push'
alias blog_post='cd ~/Repos/blog && git add . && git commit -m "auto push" && git push && cd -'
alias config='ranger ~/.config'
alias repos='ranger ~/Repos'
alias zrc='nvim ~/.zshrc'
alias zsource='source ~/.zshrc'
alias ls='exa --color=always --group-directories-first'
alias plague='curl https://corona-stats.online/states/us'
alias p='sudo pacman -S'
alias y='yay -S'
alias fshoot_full='flameshot full -p ~/pics/screenshots'
alias kill_vbox="kill $(ps -e | grep VirtualBox | awk '{ print $1 }')"
alias wallpapers="sxiv /storage/pics/wallpapers"
alias list_systemctl="systemctl list-unit-files --state=enabled"
alias kill_jupyter="killall jupyter-lab"
alias set_python_path="source set_python_path"
alias cat="ccat"
alias greeter="dm-tool switch-to-greeter"
alias small_text="sed -i 's/size: 22.0/size: 15.0/g' ~/.config/alacritty/alacritty.yml"
alias big_text="sed -i 's/size: 15.0/size: 22.0/g' ~/.config/alacritty/alacritty.yml"
alias logout="dm-tool switch-to-greeter"
alias i3-logout="i3-msg exit"
alias monitors="xrandr -q | grep " connected" | cut -d ' ' -f1"
alias random_background="feh --bg-fill --randomize ~/Pics/wallpapers/*"

# Include hidden files in autocomplete:
# _comp_options+=(globdots)
# export PROMPT_COMMAND="pwd > /tmp/whereami"

# Junk added by robot

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/${USER}/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/$USER/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# export PATH="$HOME/.miniconda/bin:$PATH"  # commented out by conda initialize  # commented out by conda initialize

source /home/$USER/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/home/$USER/.fnm:$PATH
eval "`fnm env --multi`"

export MANPAGER='nvim +Man!'
export MANWIDTH=999

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
#export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
