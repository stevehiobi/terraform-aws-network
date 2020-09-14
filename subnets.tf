resource "aws_subnet" "public" {
  count = length(var.subnet_cidrs_public)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs_public[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      "Name"       = "${var.project} Public Subnet ${count.index}",
      "SubnetType" = "Public"
    },
    var.tags,
    var.public_subnet_tags
  )
}

resource "aws_subnet" "private" {
  count = length(var.subnet_cidrs_private)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs_private[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      "Name"       = "${var.project} Private Subnet ${count.index}",
      "SubnetType" = "Private"
    },
    var.tags,
    var.private_subnet_tags
  )
}

resource "aws_subnet" "mgmt" {
  count = length(var.subnet_cidrs_mgmt)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs_mgmt[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      "Name"       = "${var.project} MGMT Subnet ${count.index}",
      "SubnetType" = "Mgmt"
    },
    var.tags
  )
}