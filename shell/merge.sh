: <<EOF
merge [tab] branch  -p
EOF
# TODO: 切换目录无法使用tab提示
if [ $1 ]; then
  git stash
  git fetch origin $1
  git merge FETCH_HEAD
  git stash pop
  branch=$1
  shift 1
  while getopts "p" opt; do
    case "$opt" in
    "p")
      git push origin HEAD:$branch
      ;;
    esac
  done
else
  echo "选择merge分支"
fi
