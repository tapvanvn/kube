# KUBE
## install
run maintain.sh without sudo permission after download this bundle
## commands
- kubeallpods <namespace> : get all pods in namespace. If there is no namespace had been provided, display for all namespaces.
- kubesh <label>: run kubectl exec ... -- sh in first pod found by label in case label format is a=b (ex:label=test), or label will be app=label
- kubebash <label> : same as kubesh but with bash

## command with helm
- setHelmVersion <version> <chart_dir> : set appVersion in Chart.yaml in chart directory to version
- nextHelmVersionWithFile <version_file> <chart_dir> <update_level> : update appVersion of chart base on version file (file with content is version (x.y.z)). update level: x~0, y~1, z~2.