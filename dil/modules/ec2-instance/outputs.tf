# output "instances_public_ips" {
#   description = "Public IPs assigned to the EC2 instance"
#   value       = module.ec2.public_ip
# }

# output "ebs_volume_attachment_id" {
#   description = "The volume ID"
#   value       = aws_volume_attachment.this_ec2.*.volume_id
# }

# output "ebs_volume_attachment_instance_id" {
#   description = "The instance ID"
#   value       = aws_volume_attachment.this_ec2.*.instance_id
# }


# output "this_key_pair_key_name" {
#   description = "The key pair name."
#   value       = module.key-pair.this_key_pair_key_name
# }

# output "this_key_pair_key_pair_id" {
#   description = "The key pair ID."
#   value       = module.key-pair.this_key_pair_key_pair_id
# }

# output "this_key_pair_fingerprint" {
#   description = "The MD5 public key fingerprint as specified in section 4 of RFC 4716."
#   value       = module.key-pair.this_key_pair_fingerprint
# }
