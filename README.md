# Kubernetes-Exercise

This is a project that has some .NET Core app dockerization and a couple of Kubernetes configs.

# Docker

## Building the Image
We can quickly build the Docker image with:
```
docker build -t <IMAGE_NAME> <DOCKERFILE_LOCATION>
```
We can also add `--progress plain` to see the outputs more detailed or `--no-cache` to build with no cache. 

## Running the Container
To test the image before we send it to the registry:
```
docker run -it --rm -p <HOST_PORT>:<CONTAINER_PORT>  --name <CONTAINER_NAME> <IMAGE_NAME>
```
By default CONTAINER_PORT is *80* and the environment is *Production*. In order to modify the launch configurations, we can enable environments such as `-e ASPNETCORE_ENVIRONMENT=Development` and `-e ASPNETCORE_URLS=http://localhost:5001/`. For more information on environments, you can check out [this](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/host/web-host?view=aspnetcore-6.0#host-configuration-values) page.

## Uploading the Image to Docker Hub
After getting an account from Docker Hub, we should login to their registry with `docker login`. Afterwards:
```shell
docker tag <IMAGE_NAME>:<TAG> <REGISTRY_REPO_ADDRESS>:<TAG> #Tag our local image according to our address on Docker Hub.
docker push <REGISTRY_REPO_ADDRESS>:<TAG>
```
For more information on this, you can take a look at [this](https://docs.docker.com/docker-hub/) page.

# Kubernetes
All configs are under `k8s-configs/` folder. There is also a script to make the deployment.

# Resources
* https://medium.com/executeautomation/how-to-run-net-core-app-with-specific-launch-profile-in-docker-container-2905b350b420
* https://learn.microsoft.com/tr-tr/aspnet/core/host-and-deploy/docker/building-net-docker-images
* https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
* https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/
* https://binx.io/nl/2022/01/18/how-to-run-a-post-deployment-script-on-kubernetes/