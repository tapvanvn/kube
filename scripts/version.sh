function nextVersion {
    from_version=$1
    update_level=$2

    [[ $from_version =~ ([0-9]+).([0-9]+).([0-9]+) ]] &&
    major=${BASH_REMATCH[1]}
    minor=${BASH_REMATCH[2]}
    sub=${BASH_REMATCH[3]}

    if [ $update_level -eq 0 ]; then 
        major=$(( $major + 1 ))
        minor=0
        sub=0
    elif [ $update_level -eq 1 ]; then 
        minor=$(( $minor + 1 ))
        sub=0
    elif [ $update_level -eq 2 ]; then 
        sub=$(( $sub + 1 ))
    fi

    new_version=$major.$minor.$sub
    echo "$new_version"
}