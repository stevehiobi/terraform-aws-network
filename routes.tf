resource "aws_route_table" "public" {
  count  = length(var.subnet_cidrs_public)
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = "${var.project} public route table"
    },
    var.tags
  )
}

resource "aws_route_table" "private" {
  count  = length(var.subnet_cidrs_private)
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = "${var.project} private route table"
    },
    var.tags
  )
}

resource "aws_route_table" "mgmt" {
  count  = length(var.subnet_cidrs_mgmt)
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = "${var.project} mgmt route table"
    },
    var.tags
  )
}

# Subnet association
#
resource "aws_route_table_association" "public" {
  count = length(aws_route_table.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route_table_association" "private" {
  count = length(aws_route_table.private)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "mgmt" {
  count = length(aws_route_table.mgmt)

  subnet_id      = aws_subnet.mgmt[count.index].id
  route_table_id = aws_route_table.mgmt[count.index].id
}

# Add routes to route tables
#
resource "aws_route" "internet" {
  count                  = length(aws_route_table.public)
  route_table_id         = aws_route_table.public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
