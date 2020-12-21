output "this_iam_user_name" {
  description = "The user's name"
  value       = module.iam_user1.this_iam_user_name
}

output "this_iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = module.iam_user1.this_iam_user_arn
}

output "this_iam_access_key_id" {
  description = "The access key ID"
  value       = module.iam_user1.this_iam_access_key_id
}

output "this_iam_access_key_secret" {
  description = "The access key secret"
  value       = module.iam_user1.this_iam_access_key_secret
}


output "this_iam_access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded"
  value       = module.iam_user1.this_iam_access_key_encrypted_secret
}

output "keybase_secret_key_decrypt_command" {
  description = "Decrypt access secret key command"
  value       = module.iam_user1.keybase_secret_key_decrypt_command
}

output "keybase_secret_key_pgp_message" {
  description = "Encrypted access secret key"
  value       = module.iam_user1.keybase_secret_key_pgp_message
}
