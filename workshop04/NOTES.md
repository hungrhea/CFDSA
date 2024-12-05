# retrievek metrics (will only work if metrics server is installed)
k top po -A

# bombard target URL
siege -c20 https://localhost:8080

# apply kustomization file where it is located
k apply -k .












