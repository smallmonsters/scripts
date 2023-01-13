# 备份.zshrc文件
backup_config() {
  cp $HOME/.zshrc $HOME/mac_init
  time=$(date "+%Y-%m-%d %H:%M:%S")
  echo '#'$time >>$HOME/mac_init/.zshrc
}
backup_config
exit 1
