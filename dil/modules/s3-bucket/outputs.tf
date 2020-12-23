output "dil_terraform_state_bucket" {
  description = " The name of the bucket."
  value       = module.dil_terraform_state_bucket.this_s3_bucket_id
}

output "dil_data_bucket" {
  description = " The name of the bucket."
  value       = module.dil_data_bucket.this_s3_bucket_id
}



output "vpc_s3_endpoint" {

  value = module.vpc.vpc_endpoint_s3_id
}

