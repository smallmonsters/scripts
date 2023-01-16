path=$HOME/scripts

if [ $1 == 'mac-init' ]; then
  mv ./scripts $HOME/
  $HOME/scripts/mac_init/bootstrap.sh
else
  if [! -d $path]; then
    mkdir $path
  fi
  cp -r ./shell $path
  echo "export PATH=\$PATH:\$HOME/scripts/shell" >>$HOME/.zshrc
fi
