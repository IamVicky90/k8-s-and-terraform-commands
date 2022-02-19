Kubernetes,Terraform Commands ☸️🐳📦
===


###### tags: `tutorials` `cloud` `k8's`

```bash=
$ kubectl config get-clusters
$ kubectl cluster-info
$ kubectl config get-contexts
$ kubectl config current-context
$ kubectl config use-context docker-desktop

$ kubectl get all
$ kubectl get services
$ kubectl get svc 
$ kubectl get pods
$ kubectl get nodes
$ kubectl get rs
$ kubectl get configmaps
$ kubectl get namespaces
$ kubectl get ds
$ kubectl get secrets
$ kubectl get pv
$ kubectl get pvc
$ kubectl get ns
$ kubectl get pod -n <ns>

$ kubectl describe nodes <node-id>
$ kubectl describe pods <pod-id>
$ kubectl describe rs <rs-id>
$ kubectl describe svc <svc-id>
$ kubectl describe ns <ns-name>

$ kubectl delete pods <pod-id>
$ kubectl delete nodes <node-id>
$ kubectl delete rs <rs-id>
$ kubectl delete svc <svc-id>
$ kubectl delete ns <ns-name>

$ kubectl apply -f argocd-deploy.yaml
$ kubectl apply -f ingress-svc.yaml
$ kubectl apply -f pods.yaml

$ kubectl attach <pod-name> #watch log in realtime
$ kubectl port-forward deployment/argocd-deploy 8080:8080
$ kubectl logs <pod-name>/<svc-name>/<deployment-name>

$ kubectl scale deployment argo-deploy --replicas=10 
$ kubectl autoscale deployment argocd-deploy --cpu-percent=50 --min=1 --max=10 #HPA Scaling
$ kubectl run nginx --image=nginx:latest --restart=Always --dry-run=client
$ kubectl run nginx --image=nginx:latest -n aiops

$ kubectl run nginx1 --image=nginx --dry-run=client -o yaml > pod-spec.yaml

$ docker system prune

23 Jan 2022

$ Kubectl get pod <name_of_pod>
$ kubectl get pod <name> -o wide
$ kubectl get deployment <name_of_deploy> -o yaml > <name>.yaml


## Configmap and Secrets

kubectl create secret generic db-user-pass --from-file=./username.txt --from-file=./password.txt
kubectl create secret generic db-user-pass --from-literal=username=devuser --from-literal=password='S!B\*d$zDsb='
kubectl get secret db-user-pass -o jsonpath='{.data}'

### HPA(Pod Autoscaler)

1. Create Deployment and Services

$ kubectl apply -f deployment.yaml
$ kubectl apply -f services.yaml

2. Setup a metric server

Launch RBAC Policies, Services and Certs

$ kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

Perform a Patching of Metric-Server

$ kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'

3. To confirm that Metrics Server is running, run the following command:

$ kubectl get pods -n kube-system -l k8s-app=metrics-server

4. Perform Autoscaling
$ kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

5. Get into load-balancer pod
$ kubectl run -i --tty load-generator --image=busybox /bin/sh

6. Testing load balancer

while true; do wget -q -O- http://php-apache; done





**Delete all Exited Containers**

docker rm $(docker ps -q -f status=exited)

**Delete all Stopped Containers**

docker rm $(docker ps -a -q)

**Delete All Running and Stopped Containers**

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

**Remove all containers, without any criteria**

docker container rm $(docker container ps -aq)


$ terraform init
$ terraform plan
$ terraform apply
$ terraform destroy

#All are for aws resource infra provisioning


```

**Basic yaml📝:**



**Glossary🔖:**

1. rs : Replicaset
2. svc: Services
3. svc/node/pod-id : It is the name of the particular pod/svc/node.
4. pv: persistent volume
5. pvc: persistent VolumeClaim
6. HPA: Horizontal Pod Auto-Scaling

**Launch K8's in 5 min!**

1. https://www.civo.com/learn/creating-a-cluster-the-path-to-success
2. https://www.civo.com/learn/deploy-your-first-kubernetes-application-through-the-command-line
3. https://rancher.com/docs/k3s/latest/en/


Fuseml Important Hosts

🚢 Deploying Quarks.............
✔️  Quarks deployed

🚢 Deploying Workloads...
✔️  Workloads deployed

🚢 Deploying MLflow........................................................................................................................................................
✔️  Minio deployed (http://minio.212.2.240.30.omg.howdoi.website).

✔️  MLflow deployed (http://mlflow.212.2.240.30.omg.howdoi.website).

🚢 Deploying Gitea..........................................................................................................................
✔️  Gitea deployed (http://gitea.212.2.240.30.omg.howdoi.website).

🚢 Deploying Registry........................
✔️  Registry deployed

🚢 Deploying Tekton......................................................................
✔️  Tekton deployed (http://tekton.212.2.240.30.omg.howdoi.website).

🚢 Deploying Core..............
✔️  FuseML core component deployed (http://fuseml-core.212.2.240.30.omg.howdoi.website).

https://github.com/DARK-art108/Nginx-Server



```
  163  kubectl create cm aiops --from-literal=user=ritesh --from-literal=course=ml
  164  kubectl get cm
  165  kubectl get cm aiops
  166  kubectl describe cm aiops
  168  kubectl get cm aiops -o yaml > cm-aiops.yaml
  170  nano cm-aiops.yaml
  171  kubectl describe cm --help
```

```
apiVersion: v1
kind: Service
metadata:
  name: php-apache
  labels:
    run: php-apache
spec:
  ports:
  - port: 80
  selector:
    run: php-apache
```

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: php-apache
spec:
  selector:
    matchLabels:
      run: php-apache
  replicas: 1
  template:
    metadata:
      labels:
        run: php-apache
    spec:
      containers:
      - name: php-apache
        image: k8s.gcr.io/hpa-example
        ports:
        - containerPort: 80
        resources:
          limits:
            cpu: 500m
          requests:
            cpu: 200m
```


-------------------------

helm cmds

helm create mychart
helm template demoHelmChart
helm lint chartname
helm install example ./mychart --set service.type=NodePort
helm package ./mychart
helm install example3 mychart-0.1.0.tgz --set service.type=NodePort
