function fish_prompt
    set_color $fish_color_cwd
    echo -n (basename $PWD)
    set_color normal
    echo -n ' ) '
end

function vim
    nvim $argv
end 

function vi
    nvim $argv
end 

function j
    autojump $argv
end

function l
    ll 
end
