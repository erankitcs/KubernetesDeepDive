kubectl get nodes
kubectl get deploy
kubectl apply -f deploy.yml
kubectl get deploy --watch
kubectl get deploy nginxapp
kubectl describe deploy nginxapp
kubectl get rs
## Update replicas to 6 in yml
kubectl apply -f deploy.yml
kubectl get deploy nginxapp --watch
## Update image to 1.13 in yml
kubectl apply -f deploy.yml
kubectl rollout status deploy nginxapp
## You will find two replica set 1- current, 2- old version for rollback.
kubectl get rs
## Update image to 1.14 and maxSurge to 50%
kubectl apply -f deploy.yml
kubectl rollout status deploy nginxapp
## Update image to 1.15. --record with save the command with rollout history
kubectl apply -f deploy.yml --record
kubectl get rs --watch
kubectl rollout history deploy nginxapp
kubectl rollout history deploy nginxapp --revision=4
kubectl rollout undo deploy nginxapp
kubectl describe deploy nginxapp