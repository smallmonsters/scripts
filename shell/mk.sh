alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

mk_sh="sh filename: 创建一个sh脚本，不用加后缀"
mk_sh_m="sh filename: 创建一个sh脚本，不用加后缀,打开并移动~/scripts文件下"
mk_dir="dir file: 创建一个文件夹并进入"
mk_code="code filename/file: vscode创建一个文件/文件夹并进入"

option() {
  local file=$1
  local path=~/scripts/$file
  shift 1
  while getopts "cmo" opt; do
    case "$opt" in
    "m")
      if [ -e $path ]; then
        echo "$path文件存在"
        return
      fi
      mv $file $path
      code $path
      ;;
    esac
  done
}

mksh() {
  # mk sh -h or mk sh name -o
  local file="$2.sh"
  touch $file
  chmod +x $file
  shift 2
  option $file $*
}

dir() {
  local dir=$2
  mkdir $dir
  option $dir "-c"
}

help() {
  # echo $mk
  # echo "\r"
  # echo $mk_dir
  # echo "\r"
  echo $mk_sh
  echo "\r"
  echo $mk_sh_m
  # echo "\r"
  # echo $mk_code
  # echo "\r"
}
if test $1 = "sh"; then
  mksh $*
elif test $1 = "dir"; then
  # dir $*
  exec cd $({$pwd}1)
  # source ~/.zshrc
elif test $1 = "code"; then
  dir $2
elif test $1 = "-h"; then
  help
else
  help
fi

mksh $*
