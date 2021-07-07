# Defined via `source`
function ml --wraps='mach lint --outgoing --workdir' --description 'alias ml mach lint --outgoing --workdir'
  mach lint --outgoing --workdir $argv; 
end
