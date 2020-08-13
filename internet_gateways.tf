resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    {
      "Name" = "${var.project}-IGW-${var.environment}"
    },
    var.tags
  )
}






