cr="\e[31;49m"
cb="\e[39;49m"
cg="\e[36;49m"

# Important test, can call pre-existing functions, live enviornment
searchfunct()
{
    echo $@
: ' this is actually a comment...multiline
asdfadsf
asdf
'
#		#### How to remove array elements #####
#	delete=("-type*" "abba")
#	echo "${delete[@]}"
#	for del in ${delete[@]} ; do
#		args=(${args[@]/$del})
#	done
#	
	#echo "Slicing args : ${args[@]::2}"
	prune=()
	#### Delcare local OPTIND very important when using getopts inside functions!
	local OPTIND
	#### Could be very important, allows you to get multiple options from opt parameter
	while getopts ":hc:p:" opt; do
	   	case "$opt" in
	   		h) echo -e "\tOptions are [-p] for pruning, then search arguments after"
				echo -e "\tExample: testsearch -p steam .deb freetube    << 'steam' is only prune here, '.deb' and 'freetube' are search arguments"
	   			exit ;;
	       	c) currs+=("${OPTARG}");;
				# echo "c@ ${currs[@]}";;
	        p) prune+=("${OPTARG}");;
			
			:) echo "please" 
				exit ;;
			\?) echo "remember" 
				exit ;;
	   	esac
	done
	shift $((OPTIND -1))

	if [[ -z "$@" ]]; then
        echo 'hello'
		exit &> /dev/null
	fi
	###### Space is very crucial after @: -1  !!
	# echo "@-1 ${@: -1}"
	# echo "pruneargs: ${prune[@]}   ... currs: ${currs[@]}"
	for pur in "${!prune[@]}"; do
		prune[$pur]="-iname ${prune[$pur]}"
		if [[ $pur -gt 0 ]]; then
			prune[$pur]="-o ${prune[$pur]}"
		fi
		# pur="-iname $pur -prune"
		# echo "-iname ${prune[$pur]} -prune"
	done

	searchArgs=("${@:1:$#-1}")
	for ar in "${!searchArgs[@]}"; do
		searchArgs[$ar]="-iname '*${searchArgs[$ar]}*'"
		if [[ $ar -gt 0 ]]; then
			searchArgs[$ar]="-o ${searchArgs[$ar]}"
		fi
	done

	# echo "prune@ ${prune[@]}"
	if [[ -z "${prune[@]}" ]]; then
		result="${@: -1} -type f ( ${searchArgs[@]} ) -print"
	else
		result="${@: -1} -type d ( ${prune[@]} ) -prune -o -type f ( ${searchArgs[@]} ) -print"
	fi

	total="find ${result}" 
    #eval$($total)
    #eval $($total) && fzy | xargs xdg-open # &> /dev/null
    #eval $total | fzy | xargs xdg-open # &> /dev/null
    echo ${result}
    #find for i in ${result}; print $i # | fzy | xargs xdg-open # &> /dev/null
	echo -e "\n\tFind command executed: find ${result}\n"
}

mynotes() {
    if [[ -z "$@" ]]; then
        tac  ~/notes/note.note | less
	elif [[ -n "$@" ]]; then
        echo "$@" >> ~/notes/note.note
    fi
}

myvidswatched() {
    if [[ "$@" == '-h' ]]; then
        echo "  -c    |   Append recently watched to the file"
    elif [[ "$@" == '-c' ]]; then
        cat /$HOME/.config/vlc/vlc-qt-interface.conf | grep list= | awk -F "," '{for (i=1; i<=15; i++) print $i}' | awk -F "/" '{print $(NF-2)"/"$(NF-1)"/"$(NF)}' | sed -E 's/%20/ /g;s/%2C/,/g' | tac >> /mnt/hdd/Videos/.watched.txt | sleep 2s && less +G /mnt/hdd/Videos/.watched.txt
    else
        less +G /mnt/hdd/Videos/.watched.txt
    fi
}


mytmux() {
tmux new-session \ 
  send-keys \'btop\' C-m \
  new-window \
  split-window -h -p 65 \
  select-pane -t 0 \
  split-window -v -p 40 \
  send-keys \'top\' C-m
}

checkenv() {
    python3 <<EOF
####
#### This irritating spacing is important to the parsing of the script by bash ####
import sys
if sys.prefix == sys.base_prefix:
    print("No, you are not in a virtual environment.")
else:
    print("Yes, you are in a virtual environment.")
EOF
}

#mynotes() {
#    DATE=$(date)
#    echo -e "$*     $DATE" >> ~/notes/video-general.txt
#}



videosearch() {
	searchfunct $@ '/mnt/hdd/Videos'
}

#homesearch() {
#	searchfunct $@ '/home/ryan'
#}
#
#mennosearch() {
#	searchfunct $@ '/mnt/hdd/Downloads/websitedownload/Recipes/MennoniteGirls/www.mennonitegirlscancook.ca'
#}
#
#codesearch() {
#    searchfunct $@ '/mnt/hdd/Downloads/websitedownload/morelinux'
#}


ftoc() {
    #degreeC=$'\xe2\x84\x83'
    degree=$'\xc2\xb0'
    local OPTIND
    while getopts ":f:c:" option; do
        case $option in
            f) # Celsius to Fahrenheit
                let ctof="($2*1.8)+32"
                printf "Converted to %.2f%sF\n" $ctof $degree
                ;;
            c) # Fahrenheit to Celsius
                let ftoc="($2-32)/1.8"
                printf "Converted to %.2f%sC\n" $ftoc $degree
                ;;
            :) echo -e "Miss argssss"
                ;;
            \?) echo -e "Invalid opts \"${1}\" is bad"
                ;;
        esac
    done
    #shift $((OPTIND -1))
}

weather() {
	if [[ "$1" == "-h" ]]; then
	    curl wttr.in/:help
	elif [[ $1 == "-a" ]]; then
		curl wttr.in/"yyj?m"
	else  ### YYJ airport, ? options p and 1
	    curl wttr.in/"yyj?2pm"
	fi
}

s() {
    o https://www.startpage.com/do/dsearch?query="$1"
}

dic() {
    o https://www.thefreedictionary.com/"$1" > /dev/null
    # open https://www.dictionary.com/browse/"$1"
}

asendryan-d() {
    scp ashleyhp:/home/ashley/.sendtoryan /home/ryan/notes/asendryan.txt
}

m() {
    python3 -c "from math import *; print($*)"
}

mytodo() {
	if [[ "$1" == "-h" ]]; then
        echo -e "Usage and commands info:"
        echo -e "\tSyntax: mytodo -[h|l|r]"
        echo -e "\tExample: mytodo -h  (shows this help)"
        echo -e "\tFlags:"
        echo -e "\t-e     Edit file in vim"
        echo -e "\t-h     Print this Help"
        echo -e "\t-l     Print todo list"
        echo -e "\t-r     Print a random todo\n"
	elif [[ $1 == "-a" ]]; then
    # xargs trims the whitepsace before apppending
        echo "${*:2}" | xargs >> ~/notes/todo.txt
	elif [[ $1 == "-e" ]]; then
        v ~/notes/todo.txt
	elif [[ $1 == "-l" ]]; then
        less ~/notes/todo.txt
    elif [[ $1 == "-r" ]]; then
        cat ~/notes/todo.txt | shuf -n 1
	else  
	fi
}

function countdown {
        local OLD_IFS="${IFS}"
        IFS=":"
        local ARR=( $1 ) ; shift
        IFS="${OLD_IFS}"
        local PREFIX="$*" ; [ -n "${PREFIX}" ] && PREFIX="${PREFIX} > "
        #local SECONDS=$(( ${ARR[0]#0} * 3600 + ${ARR[1]#0} * 60 + ${ARR[2]#0} ))
        local SECONDS=$((  (ARR[0] * 60 * 60) + (ARR[1] * 60) + ARR[2]  ))
        local START=$(date +%s)
        local END=$((START + SECONDS))
        local CUR=$START

        while [[ $CUR -lt $END ]]
        do
                CUR=$(date +%s)
                LEFT=$((END-CUR))

                printf "\r%s%02d:%02d:%02d" \
                        "${PREFIX}" $((LEFT/3600)) $(( (LEFT/60)%60)) $((LEFT%60))

                sleep 1
        done
        echo "        "
}
