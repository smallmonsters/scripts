#!bin/bash
[ -z "${BRANCH}" ] && export BRANCH="master"

# if [[ -e ~/.macbootstrap ]]; then
#   rm -rf ~/.macbootstrap
# fi

xcode-select --install

cp ./.zshrc $HOME/.zshrc
source $HOME/.zshrc

# 安装brew
# TODO: 这个路径应该不对
if [[ ! -e /usr/local/bin/brew ]]; then
  git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git
  brew-install
  /bin/bash brew-install/install.sh
  rm -rf brew-install

  for tap in core cask{,-fonts,-drivers,-versions} command-not-found; do
    brew tap --custom-remote --force-auto-update "homebrew/${tap}" "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
  done

  brew update
  # chcange source && avoid prompt && quiet install
  # 这里下载下来不知道下载到那里，如果在opt目录下，可能后面的脚本就不对了
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | sed 's/https:\/\/github.com\/Homebrew\/brew/git:\/\/mirrors.ustc.edu.cn\/brew.git/g' | sed 's/https:\/\/github.com\/Homebrew\/homebrew-core/git:\/\/mirrors.ustc.edu.cn\/homebrew-core.git/g' | sed 's/\"fetch\"/\"fetch\", \"-q\"/g')" </dev/null >/dev/null

  # Change source
  cd "$(brew --repo)"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
  git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

  export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
else
  echo "You have installed brew"
fi

brew install git

# git clone --depth=1 -b ${BRANCH} https://github.com/bestswifter/macbootstrap.git ~/.macbootstrap
# cd ~/.macbootstrap
bash install.sh
