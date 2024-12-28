# sample-java-gradle-app

##### Build the project

```bash
    ./gradlew build
```

##### Run the project

```bash
    java -jar ./build/libs/sample-java-gradle-app.jar
```


##### Configure Pipeline

```bash
# Create a docker secret with docker registry creds for pushing the app image
# The secret below is used by the tekton sa
kubectl create secret docker-registry docker-secret --docker-server=$DOCKER_REGISTRY_SERVER --docker-username=$DOCKER_USER --docker-password=$DOCKER_PASSWORD --docker-email=$DOCKER_EMAIL

# The secret below again contains docker registry but the above secret can be re-used
# secrets-reg-creds.yaml will be in local macine as it contains the encoded creds
# Note: use echo -n <secret value> | base64 to remove the new line that gets generated automatically with echo
kubectl apply -f ./.tekton/secrets-reg-creds.yaml

kubectl apply -f ./.tekton/pipeline-storage.yaml
kubectl apply -f ./.tekton/pipeline-sa.yaml
kubectl apply -f ./.tekton/pipeline-tasks.yaml
kubectl apply -f ./.tekton/pipeline-task-deploy.yaml
kubectl apply -f ./.tekton/pipeline.yaml
kubectl apply -f ./.tekton/pipelinerun.yaml

kubectl get pr
```



