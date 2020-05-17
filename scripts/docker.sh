#build docker image and push to registry server if need
function buildDockerImage(){
    err=0
    if [ "$#" -lt 4 ]; then
        echo "Illegal number of parameters"
        echo "format 1: updateDockerImage docker_file docker_woking_dir image_name tag"
        echo "format 2: updateDockerImage docker_file docker_woking_dir image_name tag registry_url"
        err=1
    fi

    docker_file=$1
    docker_root_dir=$2
    docker_image=$3
    docker_tag=$4

    if [ "$#" -eq 5 ]; then
        registry_url=$5
    fi

    if [ -f $docker_file ]; then

        if [ -d $docker_root_dir ]; then
            
            docker build -t $docker_image:$docker_tag -f $docker_file $docker_root_dir

            docker_build_err=$?
            if [ $docker_build_err -ne 0 ]; then
                echo "docker build fail"
                err=1
            else
                echo "docker build success"

                if [ -n "$registry_url" ];then
                    

                    image_and_tag="$registry_url/$docker_image:$docker_tag"
                    docker image tag $docker_image:$docker_tag $image_and_tag
                    docker push $image_and_tag
                    push_err=$?
                    if [ $push_err -ne 0 ];then 
                        echo "push image fail"
                        err=1
                    else 
                        echo "push image to registry success"
                    fi
                fi
            fi
        else
            echo "docker woking dir is not existed"
            err=1
        fi
    else 
        echo "docker file is not existed"
        err=1
    fi
}