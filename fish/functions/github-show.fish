function github-show
  git tag -f github-show ; and git push -f origin github-show ; and open (git remote get-url origin | sed s^git@github.com:^https://github.com/^ | sed s^.git\$^/commit/(git rev-parse HEAD)^) $argv; 
end
