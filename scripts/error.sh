function trapError {
    message="error occur"
    if [ "$#" -eq 1 ]; then
        message=$1
    fi
    if [ $err -ne 0 ]; then
        echo $message
    fi
}

function trapErrorExit {
    message="error occur"
    if [ "$#" -eq 1 ]; then
        message=$1
    fi
    if [ $err -ne 0 ]; then
        echo $message
        exit 1
    fi
}