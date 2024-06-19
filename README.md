# learning-terraform

**kubectl describe pod**

**kubectl delete deployment transformation-service**
deployment.apps "transformation-service" deleted

**kubectl apply -f deployment.yaml**             
deployment.apps/transformation-service created

**kubectl describe pod**                            
Name:             transformation-service-7b7b5f4c8-89qsx
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube/`ip`
Start Time:       Tue, 11 Jun 2024 21:42:27 -0400
Labels:           app=transformation-service
                  pod-template-hash=7b7b5f4c8
Annotations:      <none>
Status:           Running
IP:               
IPs:
  IP:           
Controlled By:  ReplicaSet/transformation-service-7b7b5f4c8
Containers:
  transformation-service:
    Container ID:   docker://e1bcaab5c49089c248de02bfa66b2f64f3711427c8f910ac94e3be9f9b958c65
    Image:          transformation-service:latest
    Image ID:       docker://sha256:60218fbe480fe28bb9809bbd3d8aef08af622d370dd3ef570f036dd07b2ed367
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 11 Jun 2024 21:42:29 -0400
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 11 Jun 2024 21:42:27 -0400
      Finished:     Tue, 11 Jun 2024 21:42:29 -0400
    Ready:          True
    Restart Count:  1
    Environment:    <none>
    Mounts:
      /app/input_data.csv from input-data (rw)
      /app/output_data.csv from output-data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ftsrx (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  input-data:
    Type:          HostPath (bare host directory volume)
    Path:          /data/input_data.csv
    HostPathType:  File
  output-data:
    Type:          HostPath (bare host directory volume)
    Path:          /data/output_data.csv
    HostPathType:  File
  kube-api-access-ftsrx:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age              From               Message
  ----    ------     ----             ----               -------
  Normal  Scheduled  3s               default-scheduler  Successfully assigned default/transformation-service-7b7b5f4c8-89qsx to minikube
  Normal  Pulled     1s (x2 over 3s)  kubelet            Container image "transformation-service:latest" already present on machine
  Normal  Created    1s (x2 over 3s)  kubelet            Created container transformation-service
  Normal  Started    1s (x2 over 3s)  kubelet            Started container transformation-service
  
**kubectl get pod**
NAME                                     READY   STATUS      RESTARTS      AGE
transformation-service-7b7b5f4c8-89qsx   0/1     Completed   2 (19s ago)   23s

**kubectl get pod**
NAME                                     READY   STATUS             RESTARTS      AGE
transformation-service-7b7b5f4c8-89qsx   0/1     CrashLoopBackOff   4 (17s ago)   109s

**kubectl describe pod**                            
Name:             transformation-service-7b7b5f4c8-89qsx
Namespace:        default
Priority:         0
Service Account:  default
Node:             minikube
Start Time:       Tue, 11 Jun 2024 21:42:27 -0400
Labels:           app=transformation-service
                  pod-template-hash=7b7b5f4c8
Annotations:      <none>
Status:           Running
IP:               
IPs:
  IP:           
Controlled By:  ReplicaSet/transformation-service-7b7b5f4c8
Containers:
  transformation-service:
    Container ID:   docker://62288a9a4842fa494822fa5b8fb30ada4ddb7ba4cd1cc72490becb4143f2fbef
    Image:          transformation-service:latest
    Image ID:       docker://sha256:60218fbe480fe28bb9809bbd3d8aef08af622d370dd3ef570f036dd07b2ed367
    Port:           <none>
    Host Port:      <none>
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 11 Jun 2024 21:43:58 -0400
      Finished:     Tue, 11 Jun 2024 21:43:59 -0400
    Ready:          False
    Restart Count:  4
    Environment:    <none>
    Mounts:
      /app/input_data.csv from input-data (rw)
      /app/output_data.csv from output-data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ftsrx (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  input-data:
    Type:          HostPath (bare host directory volume)
    Path:          /data/input_data.csv
    HostPathType:  File
  output-data:
    Type:          HostPath (bare host directory volume)
    Path:          /data/output_data.csv
    HostPathType:  File
  kube-api-access-ftsrx:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                 From               Message
  ----     ------     ----                ----               -------
  Normal   Scheduled  116s                default-scheduler  Successfully assigned default/transformation-service-7b7b5f4c8-89qsx to minikube
  Normal   Pulled     26s (x5 over 116s)  kubelet            Container image "transformation-service:latest" already present on machine
  Normal   Created    26s (x5 over 116s)  kubelet            Created container transformation-service
  Normal   Started    25s (x5 over 116s)  kubelet            Started container transformation-service
  Warning  BackOff    13s (x8 over 112s)  kubelet            Back-off restarting failed container transformation-service in pod transformation-service-7b7b5f4c8-89qsx_default(17614e3d-4a4f-40d4-9985-6ffc951fff1f)

**kubectl describe deployment **

Name:                   transformation-service
Namespace:              default
CreationTimestamp:      Tue, 11 Jun 2024 21:42:27 -0400
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=transformation-service
Replicas:               1 desired | 1 updated | 1 total | 0 available | 1 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=transformation-service
  Containers:
   transformation-service:
    Image:        transformation-service:latest
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:
      /app/input_data.csv from input-data (rw)
      /app/output_data.csv from output-data (rw)
  Volumes:
   input-data:
    Type:          HostPath (bare host directory volume)
    Path:          /data/input_data.csv
    HostPathType:  File
   output-data:
    Type:          HostPath (bare host directory volume)
    Path:          /data/output_data.csv
    HostPathType:  File
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Progressing    True    NewReplicaSetAvailable
  Available      False   MinimumReplicasUnavailable
OldReplicaSets:  <none>
NewReplicaSet:   transformation-service-7b7b5f4c8 (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  3m46s  deployment-controller  Scaled up replica set transformation-service-7b7b5f4c8 to 1
  
**kubectl get deployment**
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
transformation-service   0/1     1            0           3m53s

**kubectl delete deployment transformation-service**
deployment.apps "transformation-service" deleted

**kubectl apply -f job.yaml **
job.batch/transformation-service-job created
