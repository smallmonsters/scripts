#!/bin/sh
if [[ ! -e /Applications/WeChat.app ]]; then
  brew install wechat --cask
else
  echo "You have installed WeChat"
fi

if [[ ! -e /Applications/QQ.app ]]; then
  brew install qq --cask
else
  echo "You have installed qq"
fi

if [[ ! -e /Applications/wpsoffice.app ]]; then
  brew install wpsoffice --cask
else
  echo "You have installed wps"
fi

if [[ ! -e /Applications/Google\ Chrome.app ]]; then
  brew install google-chrome --cask

  # 设置谷歌为默认浏览器
  git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
  (cd ./tools/defaultbrowser && make && make install)
  defaultbrowser chrome
  [[ -d ./tools/defaultbrowser ]] && rm -rf ./tools/defaultbrowser
else
  echo "You have installed chrome"
fi
if [[ ! -e /Applications/Visual\ Studio\ Code.app ]]; then
  brew install visual-studio-code --cask
  sh ./vscode/setup.sh
else
  echo "You have installed vscode"
fi
if [[ ! -e /Applications/网易有道词典.app ]]; then
  brew install youdaodict --cask
else
  echo "You have installed 网易有道词典"
fi

# TODO: 路径不对
if [[ ! -e /Applications/Visual\ Studio\ Code.app ]]; then
  # TODO: 这里需要配置环境吗
  brew install java --cask
else
  echo "You have installed java"
fi

# TODO: 路径不对
if [[ ! -e /Applications/IntelliJ\ IDEA.app ]]; then
  brew install --cask intellij-idea
else
  echo "You have installed intellij-idea"
fi

git clone --depth=1 https://github.com/smallmonsters/shell-script.git
mv shell-script $HOME/scripts

# brew install --HEAD universal-ctags/universal-ctags/universal-ctags
# brew install redis
# brew_install python3
# brew_install cmake
# brew_install gawk
# brew_install autojump
brew_install wget
brew_install nvm
# brew_install exiv2
# brew_install ssh-copy-id
# brew_install imagemagick
# brew_install catimg
# brew_install gpg
# brew_install icdiff
# brew_install scmpuff
# brew_install fzf
# brew_install fd
# brew_install the_silver_searcher
# brew_install nvim
# brew_install exiftool
# brew_install archey
# brew_install ranger
# brew_install git-lfs && git lfs install
# brew_install cloc
# $(brew --prefix)/opt/fzf/install --all
