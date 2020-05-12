# KUBE
## install
run maintain.sh without sudo permission after download this bundle
## commands
- kubeallpods <namespace> : get all pods in namespace. If there is no namespace had been provided, display for all namespaces.
- kubesh <label>: run kubectl exec ... -- sh in first pod found by label in case label format is a=b (ex:label=test), or label will be app=label
- kubebash <label> : same as kubesh but with bash