output "vpc_id" {
  description = "the cidr block of the vpc"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "the cidr block of the vpc"
  value       = aws_vpc.main.cidr_block
}

output "public_subnets_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "private_subnets_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "private_mgmt_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "public_routetables_ids" {
  description = "A list IDs of public route tables"
  value       = aws_route_table.public.*.id
}

output "private_routetables_ids" {
  description = "A list IDs of private route tables"
  value       = aws_route_table.private.*.id
}

output "mgmt_routetables_ids" {
  description = "A list IDs of mgmt route tables"
  value       = aws_route_table.mgmt.*.id
}