docker build -t anhmt90/multicontainers-express-srv:latest -t anhmt90/multicontainers-express-srv:$SHA -f ./server/Dockerfile ./server
docker build -t anhmt90/multicontainers-client:latest -t anhmt90/multicontainers-client:$SHA -f ./client/Dockerfile ./client
docker build -t anhmt90/multicontainers-worker:latest -t anhmt90/multicontainers-worker:$SHA -f ./worker/Dockerfile ./worker

docker push anhmt90/multicontainers-express-srv:latest
docker push anhmt90/multicontainers-express-srv:$SHA

docker push anhmt90/multicontainers-client:latest
docker push anhmt90/multicontainers-client:$SHA

docker push anhmt90/multicontainers-worker:latest
docker push anhmt90/multicontainers-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=anhmt90/multicontainers-express-srv:$SHA
kubectl set image deployments/client-deployment client=anhmt90/multicontainers-client:$SHA
kubectl set image deployments/worker-deployment worker=anhmt90/multicontainers-worker:$SHA