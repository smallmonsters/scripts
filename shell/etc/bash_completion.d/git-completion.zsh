__git_brach() {
	local dir=$(pwd)
	if [ -e ${dir}/\.git/packed-refs ]; then
		local branch=$(<${dir}/\.git/packed-refs)
		local _branch
		for VAR in $branch; do
			if [[ $VAR =~ heads ]]; then
				_branch+="${VAR#*heads/} "
			fi
			if [[ $VAR =~ origin ]]; then
				_branch+="${VAR#*origin/} "
			fi
		done
		local pre cur opts
		COMPREPLY=()
		pre=${COMP_WORDS[COMP_CWORD - 1]}
		cur=${COMP_WORDS[COMP_CWORD]}
		opts=${_branch} #补全选项
		COMPREPLY=($(compgen -W "$opts" -- $cur))
	fi

}
complete -F __git_brach merge.sh
complete -F __git_brach rebase.sh
