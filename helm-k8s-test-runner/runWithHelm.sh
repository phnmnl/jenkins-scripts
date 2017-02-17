SEED=`date +%s`
STEP2=`echo $SEED | sha256sum`
STEP3=`echo $STEP2 | base64 | tr -dc 'a-z0-9'`
NEW_UUID=`echo $STEP3 | rev | head -c5`

POD=$POD_PREFIX"-"$NEW_UUID
HELM_NAME=$POD_PREFIX"-"$NEW_UUID


helm install https://phnmnl.github.io/helm-charts/container-test-0.1.1.tgz --version 0.1.1 --set container=$CONTAINER,pod_name=$POD,test_cmd=$TEST_CMD --name $HELM_NAME
echo "Waiting for container to be started..."
sleep 10
result=`kubectl get pod $POD -o=yaml | grep 'phase' | awk -F ': ' '{ print $2 }'`
while [ "$result" = "Running" -o "$result" = "Pending" ]
        do
	echo "Sleeping for 10 seconds"
	sleep 10
	result=`kubectl get pod $POD -o=yaml | grep 'phase' | awk -F ': ' '{ print $2 }'`
done
echo "Result was: $result"
kubectl describe pods/$POD
kubectl logs $POD

helm delete $HELM_NAME

if [ "$result" = "Succeeded" ]; then
	echo "Pod finished without error codes"
	exit 0
fi

exit 1
