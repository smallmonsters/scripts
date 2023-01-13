export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias l='ls -alhF'
alias la='ls -AFh'
alias ll='ls -lhAF'
# 备份.zshrc文件
alias backup='~/scripts/startup.sh'
alias day='date "+%Y-%m-%d %H:%M:%S"'

# brew 清华镜像
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# 设置 vscode 启动命令
export PATH="$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin"

# 如果你不是通过Android Studio安装的sdk，则其路径可能不同，请自行确定清楚
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# java环境
export JAVA_HOME=$HOME/java-space/jdk/zulu-11.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin
#我的脚本
export PATH=$PATH:$HOME/scripts

getIp() {
  ifconfig en0 | grep -Eo ".* netmask " | tr -cd "[:digit:][:punct:]" | pbcopy
  ifconfig en0
}

# 复制文件夹到粘贴板
file-to-clipboard() {
  osascript \
    -e 'on run args' \
    -e 'set the clipboard to POSIX file (first item of args)' \
    -e end \
    "$@"
}

# 复制图片到粘贴板
clip_img() {
  osascript -e 'on run argv' \
    -e 'set currentDir to do shell script "pwd"' \
    -e 'set the clipboard to (read POSIX file (POSIX path of (currentDir as text & (first item of argv) )) as JPEG picture)' \
    -e 'end run' "/$1"
}
#2023-01-13 17:25:38
