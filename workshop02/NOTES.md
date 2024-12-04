



put config file in: $HOME/.kube/config

sudo ln -s kubectl k
k cluster-info
k get namespace
k get pod -nkube-system
k get pods --all-namespaces
k describe ns/myns
k api-resources


if group is core, don't specify it

yaml file convert tab to 2 spaces

k create -f file.yaml
k apply -f file.yaml # does not throw error if resource already exists
k apply -f dov-deploy.yaml

# get all the pods running in myns (namespace)
k get po -nmyns

# decribe a specific pod (dov-pod) in a specific namespace (myns)
k describe po/dov-pod -n myns
k describe pod/dov-pod -n myns
k describe pod/dov-pod -n myns --show-labels

# k describe resourceType/name -n namespace
k describe cm/dov-cm -n myns
k describe secret/dov-cm -n myns

# TEMPORARY port binding (as long as port-forward is running, can access the port)
k port-forward pod/dov-pod -n myns 8080:3000
k port-forward svc/dov-svc -n myns 5000:8080

if namespace field is not specified in .yaml file, resource is automatically created in default namespace

# get .yaml file of namespace (myns)
k get po -n myns -o yaml

# execute a command in specific pod (in specific namespace)
k exec -ti pod/dov-pod -n myns -- /bin/sh

k describe no/mynode

# get deployment under namespace (myns)
k get deployment -n myns

# get all resources (pods, deployments, etc.)
# does not return config maps, secrets
k get all -n myns

# get all config maps, secrets
k get cm,secret -n myns

# delete all pods with specific label and namespace (forcefully terminating immediately)
k delete pod -l app=dov -n myns --force --grace-period=0

# scaling deployment pods
k scale deploy/dov-pod -n myns --replicas=5

# get endpoints for specified namespace
k get ep -n myns

# run nicolaka container and execute commands inside its shell (deleted upon exit of shell)
k run debug -it --rm -n default --image nicolaka/netshoot -- /bin/bash
nslookup dov-svc.myns.svc.cluster.local (format: name.namespace.service_type.cluster.local)
nslookup -q=srv _web._TCP.dov-svc.myns.svc.cluster.local

_portName._protocol.serviceName.namespace.resourceType.cluster.local



# single command deployment (--dry-run=client to generate on client side)
k create deploy bggapp-deploy -n bggns \
    --image=stackupiss/bgg-backend:v1
    --replicas=3
    -o yaml
    --dry-run=client


# See the revision history of the deployment
k rollout history deploy/bggapp-deploy -n bggns


# get logs for a resource
k logs -f deploy/csapp-deploy -n codeserver