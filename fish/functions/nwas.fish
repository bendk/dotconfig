function nwas
    cd ~/application-services/main
    git worktree add ../$argv[1]
    cd ../$argv[1]
    git submodule update --init
end
