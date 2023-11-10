if status is-interactive
  # Commands to run in interactive sessions can go here
  set --export JAVA_HOME /lib/jvm/java-17-openjdk;
  set --export ANDROID $HOME/Android;
  set --export ANDROID_HOME $ANDROID/Sdk;
  set --export CHROME_EXECUTABLE /usr/bin/brave;
  set --export jupyter /opt/anaconda/bin/jupyter;
  set -gx PATH $ANDROID_HOME/tools $PATH;
  set -gx PATH $ANDROID_HOME/tools/bin $PATH;
  set -gx PATH $ANDROID_HOME/platform-tools $PATH;
  set -gx PATH $ANDROID_HOME/emulator $PATH;
  set -gx PATH /opt/flutter/bin/ $PATH;
  set -gx PATH ~/.cargo/bin $PATH;
  set -gx PATH ~/.yarn/bin $PATH;
  set -gx PATH ~/.local/bin $PATH;
  set fish_greeting
end

# pnpm
set -gx PNPM_HOME "/home/luisr/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# go
set -gx GOPATH "/home/luisr/go"
if not string match -q -- $GOPATH $PATH
  set -gx PATH "$GOPATH" $PATH
  set -gx PATH "$GOPATH/bin" $PATH;
end
# go end

starship init fish | source
