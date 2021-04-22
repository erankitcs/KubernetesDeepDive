## Test Locally
npm install
node .\apps.js

## Docker build
docker image build -t erankitcs/simple-node-webapp:0.1 .
docker login
docker image push erankitcs/simple-node-webapp:0.1

## K8s
kubectl apply -f .\web-deploy.yml

kubectl get deploy

kubectl apply -f .\web-nodeport.yml

kubectl get svc web-nodeport