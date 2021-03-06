if status is-interactive
  # Commands to run in interactive sessions can go here
  set --export JAVA_HOME /lib/jvm/java-11-openjdk;
  set --export ANDROID $HOME/Android;
  set --export ANDROID_HOME $ANDROID/Sdk;
  set --export CHROME_EXECUTABLE /usr/bin/brave;
  set --export GOPATH /home/luisr/go;
	set --export jupyter /opt/anaconda/bin/jupyter;
  set -gx PATH $ANDROID_HOME/tools $PATH;
  set -gx PATH $ANDROID_HOME/tools/bin $PATH;
  set -gx PATH $ANDROID_HOME/platform-tools $PATH;
  set -gx PATH $ANDROID_HOME/emulator $PATH;
  set -gx PATH /opt/flutter/bin/ $PATH;
  set -gx PATH $GOPATH/bin $PATH;
	set -gx PATH /home/luisr/.cargo/bin $PATH;
  set fish_greeting
end
