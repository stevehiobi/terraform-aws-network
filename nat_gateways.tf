##################
# NAT Gateways
##################

resource "aws_eip" "nat_gateway" {
  count = var.create_natgateways ? length(aws_route_table.private) : 0
  vpc   = true

  tags = merge(
    {
      "Name" = "${var.project}-NAT-EIP-${count.index}-${var.environment}"
    },
    var.tags
  )
}

resource "aws_nat_gateway" "natgateway" {
  count         = var.create_natgateways ? length(aws_route_table.private) : 0
  allocation_id = aws_eip.nat_gateway.*.id[count.index]
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = merge(
    {
      "Name" = "${var.project}-NAT${count.index}-${var.environment}"
    },
    var.tags
  )

  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_route" "private" {
  count                  = var.create_natgateways ? length(aws_route_table.private) : 0
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgateway[count.index].id
}