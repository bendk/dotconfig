set white 'ffffff'
set nobel '999999'
set acadia '777777'
set blackpearl '090c0d'
set greypearl '0F1516'
set oxfordblue '273338'
set mayablue '639df9'
set mustard 'ffd951'
set pumpkin 'ff7818'
set darkred '8f0000'
set turquoise '6bead7'
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showstashstate 1
set __fish_git_prompt_showuntrackedfiles 1
set __fish_git_prompt_char_stateseparator "["

function fish_prompt
  fish_prompt_host
  fish_prompt_directory
  fish_prompt_git
  fish_prompt_final
end

function fish_prompt_host
  if test (hostname) != "pitpat"
    set_color $mustard
    echo -n (whoami)"@"(hostname)" "
  end
end

function fish_prompt_directory
  set -l pwd (prompt_pwd)
  set_color $acadia
  echo -n (dirname $pwd)"/"
    set_color $mayablue
  echo -n (basename $pwd)" "
end

function fish_prompt_git
  set_color $pumpkin
  __fish_git_prompt "%s"
  echo -n "] "
end

function fish_prompt_final
  if test $status -ne 0
    set_color $darkred
    echo -n "[$status]"
  else
    set_color $nobel;
  end
  echo "> "
end
