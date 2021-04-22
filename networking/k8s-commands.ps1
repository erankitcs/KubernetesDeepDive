kubectl get nodes
kubectl cluster-info
docker container ls
docker info

cd .\networking
kubectl apply -f .\ping-deploy.yml

kubectl get deploy

kubectl get pods -o wide

kubectl get nodes -o jsonpath='{.items[*].spec.podCIDR}'

kubectl exec -it pingtest-84646bf5d4-rpftn bash





