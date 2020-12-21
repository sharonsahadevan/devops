#VPC
output "vpc_public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}


#IAM
output "this_iam_user_name" {
  description = "The user's name"
  value       = module.iam_user.this_iam_user_name
}

output "this_iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = module.iam_user.this_iam_user_arn
}

output "this_iam_access_key_id" {
  description = "The access key ID"
  value       = module.iam_user.this_iam_access_key_id
}

output "this_iam_access_key_secret" {
  description = "The access key secret"
  value       = module.iam_user.this_iam_access_key_secret
}


output "this_iam_access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded"
  value       = module.iam_user.this_iam_access_key_encrypted_secret
}

output "keybase_secret_key_decrypt_command" {
  description = "Decrypt access secret key command"
  value       = module.iam_user.keybase_secret_key_decrypt_command
}

output "keybase_secret_key_pgp_message" {
  description = "Encrypted access secret key"
  value       = module.iam_user.keybase_secret_key_pgp_message
}


#EC2
output "this_key_pair_key_name" {
  description = "The key pair name."
  value       = module.key-pair.this_key_pair_key_name
}

output "this_key_pair_key_pair_id" {
  description = "The key pair ID."
  value       = module.key-pair.this_key_pair_key_pair_id
}
