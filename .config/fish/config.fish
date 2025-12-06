oh-my-posh init fish --config $HOME/.poshthemes/montys.omp.json | source

#source ~/.config/fish/functions/myfish_functions

function nvmount
    # command mkdir $argv
    # set mount_point $argv[1]
    set mount_point "/mnt/nvme"
    if mountpoint -q $mount_point
	echo "'$mount_point' is already mounted."
    else
	sudo cryptsetup luksOpen /dev/nvme0n1p2 nvme0n1p2 || sudo mount -v /dev/mapper/nvme0n1p2 /mnt/nvme
    end
end

function last_history_item; echo $history[1]; end 
abbr -a !! --position anywhere --function last_history_item

# > funced fish_user_key_bindings

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t -- $history[1]
    commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar
  switch (commandline -t)
  # Variation on the original, vanilla "!" case
  # ===========================================
  #
  # If the `!$` is preceded by text, search backward for tokens that
  # contain that text as a substring. E.g., if we'd previously run
  #
  #   git checkout -b a_feature_branch
  #   git checkout main
  #
  # then the `fea!$` in the following would be replaced with
  # `a_feature_branch`
  #
  #   git branch -d fea!$
  #
  # and our command line would look like
  #
  #   git branch -d a_feature_branch
  #
  case "*!"
    commandline -f backward-delete-char history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
end

######################################################################
### Standard functions ############################################
###############################################################
function menno10meals
    find /mnt/hdd/downloads/websitedownload/Recipes/MennoniteGirls/www.mennonitegirlscancook.ca/ -type f ! -path 'search' ! -iname 'bread-for-journey*' ! -iname 'index.html' | shuf -n 10
end

#############################################################
### History functions here ###############################
#######################################################
function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

# TODO: Nothing fucking working here
bind ctrl-alt-o accept-autosuggestion

#########################################################################
# Very important status -i is interactive, use ! for inverse, important because jobs
# such as cron, rsync, scp are finicky about what is in the shell (interactive or not is key)
source ~/.bash_aliases
# source ~/.bash_functions
alias zshconfig="v ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias checknotifications='tail /home/ryan/notes/notifications.txt | tac | less'
alias servercheck='~/scripts/cronjobs/remind.sh servercheck && servercpu && serverraid'
alias servercpu="ssh debian-server 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'"
alias serverraid="ssh debian-server 'echo && echo RaidCheck && cat /proc/mdstat'"
alias mybible='v -o /mnt/hdd/Documents/bsb-last.txt ~/notes/biblenotes.txt'
#alias nemovids='nemo -t "/mnt/hdd/Videos/" "/mnt/hdd/Videos/Racing/" "/mnt/server-hdd/media/Videos/" &> /dev/null &'
alias ashshutdown="ssh ashleyhp 'shutdown -h now'"
# alias nvmemount="sudo cryptsetup luksOpen /dev/nvme0n1p2 nvme0n1p2 && sudo mount -v /dev/mapper/nvme0n1p2 /mnt/nvme"
alias steam_novpn="flatpak update && flatpak upgrade && nvmount; mullvad-exclude flatpak run com.valvesoftware.Steam"
alias jup='jupyter --no-browser'
alias birthdays='bat /mnt/hdd/Desktop/BIRTHDAYS.txt'
alias fix='sudo $(history -p !!)'
alias o='xdg-open'
alias meallist='cat ~/notes/meals.list | shuf -n 10'
alias bdideas='v ~/notes/ashleybirthdayideas.txt'
alias sudo='sudo '
alias today='v ~/notes/private/today.txt'
#alias menno10meals='find /mnt/hdd/Downloads/websitedownload/MennoniteGirls/www.mennonitegirlscancook.ca/ -type f ! -path 'search' ! -iname 'bread-for-journey*' ! -iname 'index.html' | shuf -n 10'
alias myreminders='v ~/notes/reminders.txt'
alias days-saved='echo $(python -c "from mypython_library import odd; days, saved_money = odd.quit_savings(quit_day=(2025,9,20)); print(f\"{days} days without and saved \${saved_money:.2f} so far.\")")'
#alias z='v ~/.zshrc'
#alias z='zoxide'
#alias mytodo='v ~/notes/todo.txt'
#alias teatime='sleep 300 && cvlc -R file:///home/ryan/Music/mixkit-scanning-sci-fi-alarm-905.wav'
alias h='history | fzy'
alias webdownload='cd /mnt/hdd/downloads/websitedownload/'
alias asendryan-download='scp ashleyhp:/home/ashley/.sendtoryan /home/ryan/notes/asendryan.txt'
alias vids='ranger /mnt/server-hdd/media/Videos /mnt/hdd/Videos /mnt/hdd/Videos/Racing'
alias checkvlc="cat /$HOME/.config/vlc/vlc-qt-interface.conf | grep list= | awk -F "," '{print $0}'"
#alias mylastwatched='cat /$HOME/.config/vlc/vlc-qt-interface.conf | grep list= | awk -F "," '{for (i=1; i<=NF; i++) print $i}' | awk -F "/" '{print $(NF-2)"/"$(NF-1)"/"$(NF)}' | sed -E 's/%20/ /g;s/%2C/,/g' | head -30 | less'
alias servervideobackup='rsync -rauhL --progress --exclude-from=/mnt/hdd/Videos/.exclude-shows.txt /mnt/hdd/Videos /mnt/server-hdd/media'
alias dzlauncher='~/gitclones/dztui/dzgui.sh'
alias v='nvim'
alias e='exa --group-directories-first'
alias fd='fdfind'
alias diff='diff --color="always"'
alias myprayers='v ~/notes/prayers.txt'
alias accsetups='cd /home/ryan/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/compatdata/805550/pfx/drive_c/users/steamuser/Documents/Assetto\ Corsa\ Competizione/Setups'
alias f='cd $(find . -type d | fzf)'
alias sm='xmodmap -e "pointer = 1 2 3"'
alias lm='xmodmap -e "pointer = 3 2 1"'
#alias shopping='bat ~/notes/myshoppinglist.list | fzy'
#alias mybins='bat ~/notes/binstoremember.list | fzy'
#alias ls='echo "testing"'
#alias aaasearchtest='find /home/ryan/Downloads'
#alias ttttt='searchfunct $@ /home/ryan/Downloads'
#alias ..='cd ..'
#alias ...='cd ../..'
#alias ....='cd ../../..'
#alias .....='cd ../../../..'
#alias up='cd ..'
#alias mennosearch='bash /home/ryan/scripts/aliases/menosearch.sh'
#alias fuck='sudo !!'


#set -o vi
set fish_help_browser brave-browser
set -g fish_greeting
fish_vi_key_bindings

#abbr -a gco='git checkout'
#abbr -a vi='nvim'
#funcsave v
#function v
#  command nvim $argv
#  complete -c v -w nvim
#end

# alias --save v="nvim"

if status -i
    #neofetch
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end

zoxide init fish | source
