# Build Java application on AWS EKS cluster 

## Prerequisites

### Install needed tools:

kubectl: https://kubernetes.io/docs/tasks/tools/

AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

Terraform: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

minikube: https://minikube.sigs.k8s.io/docs/start/

Docker: https://docs.docker.com/engine/install/

### Create Remote backend S3 bucket 

Bucket name: hany-terraformstate

### Create Helm repo for helm packages

- Bucket name: hh-helm-dev 

- Init the repo: `helm s3 init s3://hh-helm-dev`

## Provision the infrastructure

```
cd terraform

terraform init

terraform apply
```

### Connect to K8s cluster after provisioning:

`aws eks --region us-east-2 update-kubeconfig --name dev`


## Update Github secrets

Update Github secrets with IAM access `AWS_ACCESS_KEY_ID` and secret key `AWS_SECRET_ACCESS_KEY` created from the terraform

## Development environment

We are using helm charts for packaing k8s manifests and deploy them to EKS cluster

There are two workflows for each API (airports, countries):

- countries.yaml

- airports.yaml

There are two jobs:

- Build: which build Dockerfile and push it to ECR.

- Deploy: which build helm package and deploy it to it's corresponding namespace (airports, countries).

Pushing to main branch will trigger the pipelines.

## Connecting to APIs

To connect to the APIs from your machine:

```
kubectl port-forward svc/airports 8000:8000 -n airports
kubectl port-forward svc/countries 8001:8000 -n countries
```

## Prevent inter-communication between the two services

To isolate the services from each other, apply the network policy to each namespace:

```
kind: NetworkPolicy
apiVersion: networking.k8s.io/v1
metadata:
  name: default-deny
spec:
  podSelector:
    matchLabels: {}
```

## local environment

We will use Minikube and Docker for local development

To start the cluster: `minikube start`

Before deploy, we need to authenticate to AWS ECS for docker images pull:

```
minikube addons configure registry-creds
minikube addons enable registry-creds
```

To deploy airports API:

```
cd helm/airports
helm upgrade --intsall airports -f values.yaml -n airports --create-namespace
```

To deploy countries API:

```
cd helm/countries
helm upgrade --intsall countries -f values.yaml -n countries --create-namespace
```