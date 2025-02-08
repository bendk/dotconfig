function jj-done
for branch in $argv
    jj abandon $branch::
    jj branch delete $branch
end
end
