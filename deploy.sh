set -e


NAME="kubernetes-project"
USERNAME="g4lib"
IMAGE="$USERNAME/$NAME:latest"

echo " Building Docker image..."
docker build -t $IMAGE .

echo " Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo " Deployment complete."
kubectl apply -f k8s-deployment.yaml
kubectl apply -f k8s-service.yaml

echo " Getting pods ..."
kubectl get pods

echo " Getting services ..."
kubectl get services

echo " Fetching the main service"
kubectl get service $NAME-service