helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm repo list

helm search

helm install ingress-nginx ingress-nginx/ingress-nginx
helm install RELEASE_NAME REPOSITORY_NAME/CHART_NAME

# deploy
# --create-namespace if specified namespace does not exist and needs to be created
helm install my-ingress ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace

# generate template for the resources (chart) before installation
helm template my-ingress ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace -f values.yaml
helm template my-ingress ingress-nginx/ingress-nginx -n ingress-nginx --create-namespace -f values.yaml > deployment.yaml
 
# list all installations across all namespaces
helm list -a

helm undeploy RELEASE_NAME -n NAMESPACE
helm undeploy my-ingress -n ingress-nginx

helm upgrade ...



# storage classes
k get storageclass
# reclaim policy: specifies whether volume is to be deleted or retained when pvc is deleted


# if pvc is able to provision a volume, it provisions a pv
k get pvc,pv -n bggns

k describe ing -n bggns

# get ingress host IP
k get svc -A



















v