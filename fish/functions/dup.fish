# Defined via `source`
function dup --wraps='sudo dnf update' --description 'alias dup sudo dnf update'
  sudo dnf update $argv; 
end
