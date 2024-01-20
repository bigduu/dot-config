if status is-interactive
    # Commands to run in interactive sessions can go here
    set --local AUTOJUMP_PATH /opt/homebrew/Cellar/autojump/22.5.3_3/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
      source $AUTOJUMP_PATH
    end
end
