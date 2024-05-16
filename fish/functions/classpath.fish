function classpath --wraps='set -x CLASSPATH ~/java/jna-5.13.0.jar ~/java/kotlinx-coroutines-core-jvm.jar' --wraps='set -gx CLASSPATH ~/java/jna-5.13.0.jar ~/java/kotlinx-coroutines-core-jvm.jar' --description 'alias classpath=set -gx CLASSPATH ~/java/jna-5.13.0.jar ~/java/kotlinx-coroutines-core-jvm.jar'
  set -gx CLASSPATH ~/java/jna-5.13.0.jar ~/java/kotlinx-coroutines-core-jvm.jar $argv
        
end
