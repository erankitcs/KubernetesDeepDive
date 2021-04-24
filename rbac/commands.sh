openssl genrsa -out rbac.key 2048
# CN is username and O is user group
openssl req -new -key rbac.key -out rbac.csr -subj "/CN=rbac/O=labs"

# For local setup
# update rbac-kubernetes-csr.yaml with below output -- <<BASE64 encoded csr>>
cat rbac.csr | base64 | tr -d '\n'
#### Create Singining request
kubectl create -f rbac-kubernetes-csr.yaml
kubectl get csr
kubectl certificate approve rbac
kubectl get csr
kubectl get csr rbac -o jsonpath='{.status.certificate}' | base64 --decode > rbac-kubernetes-csr.crt

kubectl config view -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' --raw | base64 --decode - > kubernetes-ca.crt
kubectl config set-cluster $(kubectl config view -o jsonpath='{.clusters[0].name}') --server=$(kubectl config view -o jsonpath='{.clusters[0].cluster.server}') --certificate-authority=kubernetes-ca.crt --kubeconfig=rbac-kubernetes-config --embed-certs
kubectl config set-credentials rbac --client-certificate=rbac-kubernetes-csr.crt --client-key=rbac.key --embed-certs --kubeconfig=rbac-kubernetes-config
kubectl config set-context rbac --cluster=$(kubectl config view -o jsonpath='{.clusters[0].name}') --namespace=web --user=rbac --kubeconfig=rbac-kubernetes-config

### for AWS , CA certs into s3 bucket s3/bucket/<cluster name >/pki/private/ca , download it.
openssl x509 -req -in rbac.csr -CA <CA crt> -CAkey <ca key> -CAcredential -out rbac.crt -days 365
kubectl config set-credentials rbac --client-certificate=rbac.crt --client-key=rbac.key
kubectl config set-context rbac --cluster=<ur cluster> --namespace=web --user=rbac

### Now, it will work.
kubectl get pods --namespace=web
### but when you change the context --then get pods will fail.
kubectl config set-context rbac
kubectl get pods --namespace=web

### Now, apply role and role binding, change context to default.
kubectl apply -f role.yml
kubectl apply -f rolebinding.yml
kubectl config current-context
# Now, acces will work
kubectl config set-context rbac
kubectl get pods --namespace=web
