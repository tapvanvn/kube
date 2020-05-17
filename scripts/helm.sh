#convenient while using helm

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/version.sh

function setHelmVersion {

    if [ "$#" -ne 2 ]; then
        echo "Illegal number of parameters"
        echo "format: setHelmVersion version helm_chart_dir"
    fi

    version=$1
    chart_dir=$2

    #check chart_file exist
    if [ -d "$chart_dir" ];then
        chart_file=$chart_dir/Chart.yaml
        sed -i ".bak" -e "s/^appVersion: .*$/appVersion: $version/;t" $chart_file && rm -f $char_file.bak
    else
        echo "chart directory is not existed"
    fi
}

function nextHelmVersionWithFile {

    if [ "$#" -ne 3 ]; then
        echo "Illegal number of parameters"
        echo "format: nextHelmVersionWithFile version_file helm_chart_dir update_level"
    fi

    version_file=$1
    chart_dir=$2
    update_level=$3

    if [ -f "$version_file" ]; then 

        if [ -d $chart_dir ]; then
            old_version=$(<$version_file) 
            new_version=$( nextVersion $old_version $update_level )
            echo $new_version | tee $version_file
            setHelmVersion $new_version $chart_dir
        else 
            echo "helm chart dir is not existed"
        fi

    else 
        echo "version file is not existed"
    fi
}