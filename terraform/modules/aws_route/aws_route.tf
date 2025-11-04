resource "aws_route" "this" {
  carrier_gateway_id          = var.carrier_gateway_id
  core_network_arn            = var.core_network_arn
  destination_cidr_block      = var.destination_cidr_block
  destination_ipv6_cidr_block = var.destination_ipv6_cidr_block
  destination_prefix_list_id  = var.destination_prefix_list_id
  egress_only_gateway_id      = var.egress_only_gateway_id
  gateway_id                  = var.gateway_id
  local_gateway_id            = var.local_gateway_id
  nat_gateway_id              = var.nat_gateway_id
  network_interface_id        = var.network_interface_id
  route_table_id              = var.route_table_id
  transit_gateway_id          = var.transit_gateway_id
  vpc_endpoint_id             = var.vpc_endpoint_id
  vpc_peering_connection_id   = var.vpc_peering_connection_id

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
      update = lookup(timeouts.value, "update", null)
    }
  }

}
