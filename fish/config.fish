# set -g fish_key_bindings fish_vi_key_bindings


if not set -q NEOFETCH_RUN
    neofetch
    set -Ux NEOFETCH_RUN true
end

set -Ux GITHUB_TOKEN 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
set -Ux JAVA_HOME /opt/homebrew/Cellar/openjdk/21.0.2
set -Ux EDITOR /Users/bigduu/.local/share/bob/nvim-bin/nvim
set -Ux HOME /Users/bigduu

# >>> coursier install directory >>>
set -gx PATH "$PATH:/Users/bigduu/Library/Application Support/Coursier/bin:/Users/bigduu/.config/tmux/plugins/tmuxifier/bin:/Users/bigduu/development/flutter/bin"
# <<< coursier install directory <<<
zoxide init fish | source
fzf --fish | source
