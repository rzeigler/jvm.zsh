function use_java {
    default_java
    export JAVA_VERSION="$1"
    export JAVA_HOME=$(/usr/libexec/java_home -v ${JAVA_VERSION})
    path=("$JAVA_HOME/bin" $path)
}

function default_java {
    if [ ! -z ${JAVA_HOME+x} ]
    then
        path=(${(@)path:#"${JAVA_HOME}/bin"})
        unset JAVA_HOME
    fi
}

function use_scala {
    export USE_SCALA_HOME="/usr/local/opt/scala@$1"
    if [ ! -d "$USE_SCALA_HOME" ]
    then
        echo "${1} is not an installed scala version" 1>&2
        exit 1
    fi
    default_scala
    export SCALA_HOME="${USE_SCALA_HOME}"
    path=("$SCALA_HOME/bin" $path)
}

function default_scala {
    if [ ! -z ${SCALA_HOME+x} ]
    then
        path=(${(@)path:#"${SCALA_HOME}/bin"})
        unset SCALA_HOME
    fi
}