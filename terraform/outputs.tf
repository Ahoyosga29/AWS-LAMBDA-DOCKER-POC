# Muestra el ID de la cuenta que Terraform esta utilizando.
output "aws_account_id" {
  description = "AWS account used by Terraform"
  value       = data.aws_caller_identity.current.account_id
}

# Muestra la region activa del proveedor.
output "aws_region" {
  description = "AWS region used by Terraform"
  value       = data.aws_region.current.region
}

# Muestra el ambiente seleccionado.
output "environment" {
  description = "Current deployment environment"
  value       = var.environment
}
