#!/usr/bin/bash

#shopt -s expand_aliases

alias mybible='vim -o /mnt/hdd/Documents/bsb-last.txt ~/notes/biblenotes.txt'
alias birthdays='bat /mnt/hdd/Desktop/BIRTHDAYS.txt'
alias fix='sudo $(history -p !!)'
alias o='xdg-open'
alias meallist='bat ~/notes/meals.list | shuf -n 5'
#alias menno10meals='find /mnt/hdd/Downloads/websitedownload/MennoniteGirls/www.mennonitegirlscancook.ca/ -type f ! -path 'search' ! -iname 'bread-for-journey*' ! -iname 'index.html' | shuf -n 10'
alias myreminders='vim ~/notes/reminders.txt'
#alias teatime='sleep 10 cvlc -R file:///home/ryan/Music/mixkit-scanning-sci-fi-alarm-905.wav'
alias h='history | fzy'
alias goweb='cd /mnt/hdd/Downloads/websitedownload/'
alias asendryan-download='scp ashleyhp:/home/ashley/.sendtoryan /home/ryan/notes/asendryan.txt'
alias v='vim'
alias e='exa --group-directories-first'
alias diff='diff --color="always"'
#alias shopping='bat ~/notes/myshoppinglist.list | fzy'
#alias mybins='bat ~/notes/binstoremember.list | fzy'
#alias ls='echo "testing"'
#alias aaasearchtest='find /home/ryan/Downloads'
#alias ttttt='searchfunct $@ /home/ryan/Downloads'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias up='cd ..'
#alias mennosearch='bash /home/ryan/scripts/aliases/menosearch.sh'
#alias fuck='sudo !!'

# Example aliases
alias zshconfig="v ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias checknotifications='tail /home/ryan/notes/notifications.txt | tac | less'
alias servercheck='~/scripts/cronjobs/remind.sh servercheck && servercpu'
alias servercpu="ssh fedora-server 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'"
alias mybible='v -o /mnt/hdd/Documents/bsb-last.txt ~/notes/biblenotes.txt'
#alias nemovids='nemo -t "/mnt/hdd/Videos/" "/mnt/hdd/Videos/Racing/" "/mnt/server-hdd/media/Videos/" &> /dev/null &'
alias ashshutdown="ssh ashleyhp 'shutdown -h now'"
alias jup='jupyter --no-browser'
#alias mytmux="tmux new-session \ 
#  send-keys \'btop\' C-m \
#  new-window \
#  split-window -h -p 60 \
#  select-pane -t 0 \
#  split-window -v -p 40 \
#  send-keys \'top\' C-m"
alias birthdays='bat /mnt/hdd/Desktop/BIRTHDAYS.txt'
alias fix='sudo $(history -p !!)'
alias o='xdg-open'
alias meallist='cat ~/notes/meals.list | shuf -n 10'
alias bdideas='v ~/notes/ashleybirthdayideas.txt'
alias sudo='sudo '
alias today='v ~/notes/today.txt'
#alias menno10meals='find /mnt/hdd/Downloads/websitedownload/MennoniteGirls/www.mennonitegirlscancook.ca/ -type f ! -path 'search' ! -iname 'bread-for-journey*' ! -iname 'index.html' | shuf -n 10'
alias myreminders='v ~/notes/reminders.txt'
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
