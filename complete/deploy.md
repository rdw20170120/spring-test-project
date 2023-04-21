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

1. Create an SSH tunnel for access: `kubectl port-forward mypod 8080:8080`
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
    networkpolicy.networking.k8s.io/only-from-test-one-on-port-8080 created
    ```

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Check Kubernetes: `kubectl get all`

    ```
    NAME                               READY   STATUS    RESTARTS   AGE
    pod/rest-service-fddb95bff-jbvt6   1/1     Running   0          53s

    NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
    service/kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP          2d2h
    service/rest-service   NodePort    10.105.132.218   <none>        8080:30080/TCP   53s

    NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/rest-service   1/1     1            1           53s

    NAME                                     DESIRED   CURRENT   READY   AGE
    replicaset.apps/rest-service-fddb95bff   1         1         1       53s
    ```

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Call the application (note the different port): `curl localhost:30080/greeting`
1. Tear everything down: `kubectl delete -f deployment.yaml`

    ```
    deployment.apps "rest-service" deleted
    service "rest-service" deleted
    networkpolicy.networking.k8s.io "only-from-test-one-on-port-8080" deleted
    ```

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Check Kubernetes: `kubectl get all`

    ```
    NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
    service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   44h
    ```

# Add a Kubernetes NetworkPolicy to limit the inbound traffic
Follow these steps:


