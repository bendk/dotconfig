function nwu
    cd ~/uniffi-rs/main
    git worktree add ../$argv[1]
    cd ../$argv[1]
end
