# DIL Deployment via Terraform

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
aws sts get-session-token --duration 3600 --serial-number arn:aws:iam::<aws account ID>:mfa/<username> --token-code <token>
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
