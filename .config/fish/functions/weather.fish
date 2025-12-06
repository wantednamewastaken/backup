function weather
    echo "Args: $argv"
    if string match -q '\-h' $argv
        curl wttr.in/:help
	else if string match -q '\-a' $argv
        curl wttr.in/"yyj"
    else
        curl wttr.in/"yyj?2p"
    end
end

### YYJ airport, ? options p and 1
