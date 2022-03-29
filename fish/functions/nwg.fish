function nwg
    cd ~/gecko/main
    git worktree add ../$argv[1]
    cd ../$argv[1]
end
