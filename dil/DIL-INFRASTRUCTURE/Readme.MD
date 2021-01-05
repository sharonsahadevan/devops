# DIL Deployment via Terraform

DIL dev/test AWS cloud infrastructure has been written in HCL language. Infrastructure is decoupled into multiple
parts. 

## DIL modules
1. EKS
2. Bastion-host
3. s3-bucket
4. EMR

You must follow above exact order during the deployment. EKS module will deploy required VPC and security groups.After
that bastion host,S3 and EMR has to be deployed. During the deployment enter the AWS account ID which the infrastructure is going
to be deployed.

## How to execute the modules

Go to relevant module directory and execute following commands

```
terraform init
terraform validate
terraform plan
terraform apply
```

## How to setup AWS CLI

### Install AWS CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

```
aws configure --profile <any name> #ie: dt_deployment
```
Promp will ask for your accesskey,secret ID,default region and the output you prefer. For the output you can specify "json"
Region is "eu-central-1"



### Generate session token

Following command will give you the access ID,Secret Key and the Session token. During the execution you need to use your MFA device auto genrated code as <token>

```
aws sts get-session-token --duration 3600 --serial-number arn:aws:iam::<aws account ID>:mfa/sharon.sahadevan --token-code <token>
```

## How to authenticate with EKS using Kubectl

```
aws eks --region eu-central-1 update-kubeconfig --name dil-eu-central-1-eks-dev <profile name>
```

## How to check kubconfig file

```
kubectl edit -n kube-system configmap/aws-auth
```

## How to view ALB ingress logs
```
kubectl logs -f $(kubectl get pod -n kube-system | egrep -o 'alb-ingress-controller-[A-Za-z0-9-]+') -n kube-system
```
