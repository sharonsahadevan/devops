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