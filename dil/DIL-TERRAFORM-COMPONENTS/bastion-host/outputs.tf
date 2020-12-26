output "vpc_s3_endpoint" {

  value = module.vpc.vpc_endpoint_s3_id
}

output "ip" {
  value = aws_eip.ip.public_ip
}
