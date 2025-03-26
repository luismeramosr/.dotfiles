# Commands to run in interactive sessions can go here
set --export JAVA_HOME /lib/jvm/default;
set --export ANDROID ~/.Android/Sdk;
set --export ANDROID_HOME $ANDROID;
set --export CHROME_EXECUTABLE /usr/bin/brave;
set --export GOPATH ~/go;
set --export jupyter /opt/anaconda/bin/jupyter;
set --export GOPROXY on;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH $ANDROID_HOME/emulator $PATH;
set -gx PATH /opt/flutter/bin/ $PATH;
set -gx PATH $GOPATH/bin $PATH;
set -gx PATH ~/.cargo/bin $PATH;
set -gx PATH ~/.yarn/bin $PATH;
set -gx PATH ~/.local/bin $PATH;
set -gx PATH ~/.bun/bin $PATH;

set fish_greeting
set -x SHELL /usr/bin/fish
set -x PODMAN_IGNORE_CGROUPSV1_WARNING 1
set -x GO111MODULE auto
set -x LM_STUDIO_API_BASE http://localhost:1234/v1
set -x LM_STUDIO_API_KEY NULL

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Custom user functions
if test -f ~/.config/fish/functions.fish
  source ~/.config/fish/functions.fish
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

# Cleanup local orphaned packages
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end

## Useful aliases

# Replace ls with eza
alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Get fastest mirrors
alias mirrors 'sudo reflector -f 100 --sort rate --protocol http --protocol https --connection-timeout 3 --download-timeout 3 --threads 12 --verbose --save /etc/pacman.d/mirrorlist'

## Starship prompt
if status --is-interactive
   source ("/usr/bin/starship" init fish --print-full-init | psub)
end
