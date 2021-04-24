kubectl apply -f .hpa.yml

kubectl get deploy --namespace hpademo 

kubectl get hpa --namespace hpademo 

## In new terminal
kubectl run -i --tty loader --image=busybox /bin/sh

## run -- Cluster IP
kubectl get svc --namespace hpademo
while true; do wget -q -O- http://<Cluster>; done