Prereq:

Install kubectl and AWS, terraform.
Create Remote backend S3 bucket and hh-helm-dev bucket for helm
helm s3 init s3://hh-helm-dev

Access cluster:

`aws eks --region us-east-2 update-kubeconfig --name dev`

Update Github secrets with IAM access and secret key