# Defined via `source`
function ds --wraps='dnf search' --description 'alias ds dnf search'
  dnf search $argv; 
end
