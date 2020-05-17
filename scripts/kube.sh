
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/error.sh
source $DIR/docker.sh
source $DIR/helm.sh

alias kube='kubectl'

kubeallpods() {
    local arg_num=${#}
    if [ $arg_num = 0 ]; then
        namespaces="--all-namespaces"
    else 
        namespaces="--namespace=$1"
    fi
    kubectl get pods $namespaces
}

kubebash() {
    local arg_num=${#}
    if [ $arg_num = 0 ]; then
        #run busybox
        echo "should run busybox"
    else 
        query=$1
        if ! [ "$query" != "${query/=/}" ]; then
            query="app=$query"
        fi
        kubectl exec -it $(kubectl get pods --all-namespaces -l $query -o name | head -1) -- bash
    fi
}

kubesh() {
    local arg_num=${#}
    if [ $arg_num = 0 ]; then
        #run busybox
        echo "should run busybox"
    else 
        query=$1
        if ! [ "$query" != "${query/=/}" ]; then
            query="app=$query"
        fi
        kubectl exec -it $(kubectl get pods --all-namespaces -l $query -o name | head -1) -- sh
    fi
}

kubelogs() {
    local arg_num=${#}
    if [ $arg_num -gt 0 ]; then
        query=$1
        if ! [ "$query" != "${query/=/}" ]; then
            query="app=$query"
        fi
        for p in $(kubectl get pods --all-namespaces -l $query -o custom-columns=NAME:.metadata.name); do
            if [ "$p" != "${p/$1/}" ]; then
                echo "--$p"
                kubectl logs $p
            fi
        done
    fi
}