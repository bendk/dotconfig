# Defined via `source`
function di --wraps='dnf install' --wraps='sudo dnf install' --description 'alias di sudo dnf install'
  sudo dnf install $argv; 
end
