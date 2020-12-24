resource "aws_ec2_client_vpn_network_association" "private" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn.id
  subnet_id              = local.private_subnet_1
}
