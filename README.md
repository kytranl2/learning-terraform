# Minikube 
**minikube start**

**minikube stop**

**minikube mount /Users/ky/git/transformation_python/data:/data**

**eval $(minikube docker-env)** - configure your shell to use the Docker daemon inside Minikube

# Docker
**docker build -t transformation:latest .**

# Kubectl with namespace 
**kubectl create namespace transformation**

**kubectl get namespaces**

**kubectl config set-context --current --namespace=transformation**

**kubectl apply -f deployment.yaml -n transformation**

**kubectl get pods -n transformation**

**kubectl apply -f deployment.yaml** 

**kubectl describe deployment**

**kubectl apply -f job.yaml**

**kubectl describe pod**

**kubectl get pod**
                          
**kubectl get deployment**

**kubectl delete deployment transformation**


# Helpful Commands
**kubectl config view --minify --output 'jsonpath={..namespace}'**

--output 'jsonpath={..namespace}':
The --output flag specifies the format of the output. In this case, it is using jsonpath to filter and extract specific information from the kubeconfig file.

jsonpath={..namespace}: This is a JSONPath expression used to filter and extract the namespace value from the configuration. The .. operator recursively searches for the namespace field in the JSON structure.

**kubectl rollout restart deployment transformation**

## Provisioning an Amazon EKS (Elastic Kubernetes Service) cluster with Terraform and deploying Jupyter Notebook 

**terraform init**

**terraform apply**

**terraform destroy**


# AWS
**aws eks --region us-west-2 update-kubeconfig --name my-cluster** - Configure kubectl to use the new EKS cluster.

