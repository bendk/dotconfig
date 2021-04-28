function git-delete-merged
	git branch --merged | egrep -v "(staging|production|dev|master|main)" | xargs git branch -d $argv;
end
