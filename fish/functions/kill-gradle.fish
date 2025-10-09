function kill-gradle --wraps="pkill -f '.*GradleDaemon.*'" --description "alias kill-gradle pkill -f '.*GradleDaemon.*'"
  pkill -f '.*GradleDaemon.*' $argv
        
end
