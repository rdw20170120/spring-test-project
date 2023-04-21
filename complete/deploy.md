# Deploy the application within Kubernetes
Follow these steps:

1. Ensure that we can access Kubernetes from the shell: `kubectl`

    ```
    kubectl controls the Kubernetes cluster manager.

    ...
    ```

    If we cannot, then enable Kubernetes in Docker Desktop.

1. Ensure that Kubernetes is running: `kubectl cluster-info`

    ```
    Kubernetes control plane is running at https://kubernetes.docker.internal:6443
    CoreDNS is running at https://kubernetes.docker.internal:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

    To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
    ```

1. Check Kubernetes: `kubectl get all`

    ```
    NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
    service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   44h
    ```

1. Run application as a Kubernetes pod:

    `kubectl run mypod --image=myorg/myapp --image-pull-policy=Never`

    ```
    pod/mypod created
    ```

1. Check pod status: `kubectl get pods`

    ```
    NAME    READY   STATUS    RESTARTS   AGE
    mypod   1/1     Running   0          7s
    ```

1. Create an SSH tunnel for access: `kubectl port-forward mypod 8082:8080`
1. Open another terminal shell (Bash) and execute: `curl localhost:8080/greeting`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Kill (Ctrl-C) the process to stop the SSH port forwarding.

1. Delete the pod: `kubectl delete pod mypod`

    ```
    pod "mypod" deleted
    ```

# Add a Kubernetes Service to route traffic
Follow these steps:

1. Deploy: `kubectl apply -f deployment.yaml`

    ```
    deployment.apps/rest-service created
    service/rest-service created
    ```

1. Check Kubernetes: `kubectl get all`

    ```
    NAME                               READY   STATUS    RESTARTS   AGE
    pod/rest-service-fddb95bff-925kg   1/1     Running   0          34m

    NAME                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
    service/kubernetes     ClusterIP   10.96.0.1       <none>        443/TCP    46h
    service/rest-service   ClusterIP   10.111.10.201   <none>        8080/TCP   34m

    NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/rest-service   1/1     1            1           34m
 
    NAME                                     DESIRED   CURRENT   READY   AGE
    replicaset.apps/rest-service-fddb95bff   1         1         1       34m
    ```

1. Call the application (note the different port): `curl localhost:30080/greeting`
1. Tear down the service: `kubectl delete service rest-service`

    ```
    service "rest-service" deleted
    ```

1. Tear down the deployment: `kubectl delete deployment rest-service`

    ```
    deployment.apps "rest-service" deleted
    ```

1. Check Kubernetes: `kubectl get all`

    ```
    NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
    service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   44h
    ```

# Add a Kubernetes NetworkPolicy to limit the inbound traffic
Follow these steps:


---
apiVersion: v1
kind: NetworkPolicy
metadata:
  labels:
    app: rest-service
  name: rest-service
spec:
  podSelector:
    matchLabels:
      app: rest-service
  policyTypes:
    - Ingress
    - Egress
