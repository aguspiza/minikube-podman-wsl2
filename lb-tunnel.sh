#install the loadbalancer plugin

minikube addons enable metallb

# start the  tunnel
minukube tunnel

# to test it you can run:
# kubectl apply -f test-service.yaml
# kubectl get all
# curl http://localhost:18080 
