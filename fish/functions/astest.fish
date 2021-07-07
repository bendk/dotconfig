# Defined via `source`
function astest --wraps=/home/bdk/application-services/automation/tests.py --wraps='~/application-services/automation/tests.py --check' --wraps='~/application-services/automation/tests.py changes' --wraps='~/application-services/automation/tests.py changesa' --description 'alias astest ~/application-services/automation/tests.py changes'
  ~/application-services/automation/tests.py changes $argv; 
end
