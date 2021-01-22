# Vanilla Spring App for Rancher

This project demonstrates using a SpringBoot image in a Helm chart and Rancher catalog


## Build the image for the REST service

```bash
docker build --build-arg ENV=sbx -t gregoryg/springboot-app-vanilla:v5 .
docker push gregoryg/springboot-app-vanilla:v5
```


## Run and test the image in kubernetes

```bash
kubectl run myrest --image=gregoryg/springboot-app-vanilla:v5
kubectl expose pod myrest --port=8080
kubectl port-forward pod myrest 8080
```

From another shell

```bash
curl localhost:8080/greeting?name=Leon+Red+Horse; echo
```


# Deploy using the Helm chart


# Deploy using Rancher Cluster Explorer

In the Cluster Explorer view, add a catalog: Upper left menu: Apps & Marketplace -> Chart Repositories -> Create

-   Name: vanilla-repo
-   Target type: Git Repository
-   Index URL: <https://github.com/gregoryg/springboot-app-vanilla>
-   Git Branch: master



# Test the application running in Kubernetes
```bash
kubectl port-forward
```
