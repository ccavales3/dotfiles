# Aliases
alias ca="conda activate"
alias devrep="~/Developer"
alias gitconf="nvim ~/.gitconfig"
alias npmrc="nvim ~/.npmrc"
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias ohmyzshp="nvim ~/.oh-my-zsh/oh-my-zsh-private.sh"
alias t="tmux"
alias tconf="nvim ~/.tmux.conf"
alias vimrc="nvim ~/Developer/dotfiles/.config/nvim/init.vim"
alias zshconf="nvim ~/.zshrc"

# auto suggestion format
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c6c6c"

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# remove underline for path
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Prevent common commands in history
# zshaddhistory() {
#     local line=${1%%$'\n'}
#     local cmd=${line%% *}
#     # Only those that satisfy all of the following conditions are added to the history
#     [[ ${#line} -ge 5
#        && ${cmd} != ll
#        && ${cmd} != ls
#        && ${cmd} != la
#        && ${cmd} != cd
#        && ${cmd} != man
#        && ${cmd} != scp
#        && ${cmd} != vim
#        && ${cmd} != nvim
#        && ${cmd} != less
#        && ${cmd} != ping
#        && ${cmd} != open
#        && ${cmd} != file
#        && ${cmd} != which
#        && ${cmd} != whois
#        && ${cmd} != drill
#        && ${cmd} != uname
#        && ${cmd} != md5sum
#        && ${cmd} != pacman
#        && ${cmd} != xdg-open
#        && ${cmd} != traceroute
#        && ${cmd} != speedtest-cli
#     ]]
# }
# zshaddhistory
