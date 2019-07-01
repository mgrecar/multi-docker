docker build -t mgrecar/multi-client:latest -t mgrecar/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t mgrecar/multi-server:latest -t mgrecar/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t mgrecar/multi-worker:latest -t mgrecar/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push mgrecar/multi-client:latest
docker push mgrecar/multi-server:latest
docker push mgrecar/multi-worker:latest
docker push mgrecar/multi-client:$GIT_SHA
docker push mgrecar/multi-server:$GIT_SHA
docker push mgrecar/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mgrecar/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=mgrecar/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=mgrecar/multi-worker:$GIT_SHA
