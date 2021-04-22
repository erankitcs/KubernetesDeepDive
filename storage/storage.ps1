kubectl get nodes
# Storage classes
kubectl get sc

# persistent volume
kubectl get pv

# persistent volume claim
kubectl get pvc

# Create secret
kubectl create secret generic mysql-pass --from-literal=password=Password123

# Get Secret
kubectl get secrets

kubectl apply -f .\mysql-deplyment.yml

kubectl get deploy

kubectl describe pv

kubectl describe pvc

kubectl describe pods