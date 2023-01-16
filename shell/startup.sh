# 备份.zshrc文件
path=$HOME/scripts/mac_init # 备份的路径

if [ ! -d $path ]; then
  mkdir $path
fi

backup_config() {
  cp $HOME/.zshrc $path
  time=$(date "+%Y-%m-%d %H:%M:%S")
  echo '#'$time >>$path/.zshrc
}
backup_config
exit 1
