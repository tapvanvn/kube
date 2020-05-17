# KUBE
## install
run maintain.sh without sudo permission after download this bundle
## architecture
- error handling: we assume that there is a variable "err" that has value is 0 if command success and 1 if fail. 
- if a command support error handling they will be describe "command_name: \[err] ..."
- if a command that support error handling. After calling that command, you can call "trapError message" to print message if error occur or "trapErrorExit message" to print message and do "exit 1" if an error occur.

## commands for working with kubectl
- kubeallpods <namespace> : get all pods in namespace. If there is no namespace had been provided, display for all namespaces.
- kubesh <label>: run kubectl exec ... -- sh in first pod found by label in case label format is a=b (ex:label=test), or label will be app=label
- kubebash <label> : same as kubesh but with bash

## commands for working with helm
- setHelmVersion: \[err] <version> <chart_dir> : set appVersion in Chart.yaml in chart directory to version
- nextHelmVersionWithFile:\[err] <version_file> <chart_dir> <update_level> : update appVersion of chart base on version file (file with content is version (x.y.z)). update level: x~0, y~1, z~2.

## commands for woking with docker
- buildDockerImage: \[err] <docker_file> <docker_woking_dir> <image_name> <tag> <registry_url> : build docker image and push if registry url is provided