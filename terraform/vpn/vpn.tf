resource "aws_ec2_client_vpn_endpoint" "vpn" {
  client_cidr_block      = "10.10.0.0/21"
  split_tunnel           = false
  server_certificate_arn = "arn:aws:acm:eu-west-2:xxxxxxxx:certificate/xxxxx"
  dns_servers = [
    aws_route53_resolver_endpoint.vpn_dns.ip_address.*.ip[0],
    aws_route53_resolver_endpoint.vpn_dns.ip_address.*.ip[1]
  ]

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = "arn:aws:acm:eu-west-2:xxxxxxxxx:certificate/xxxxx"
  }

  connection_log_options {
    enabled = false
  }
}
