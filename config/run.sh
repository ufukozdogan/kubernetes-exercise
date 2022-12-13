# Launch the new deployment.
kubectl apply -f deployment.yaml

# Wait for rollout to complete..
kubectl rollout status deploy/exercise-deployment --watch=true

# Wait for shutdown of terminating pods..
SELECTOR=$(kubectl get deploy/exercise-deployment -o wide --no-headers | awk '{print \$NF}')
while :
do
    POD_STATES=$(kubectl get pods --selector ${SELECTOR} --no-headers | awk '{print \$3}' | uniq)
    if [[ "$POD_STATES" == "Running" ]]; then
        break
    fi

    sleep 5
done