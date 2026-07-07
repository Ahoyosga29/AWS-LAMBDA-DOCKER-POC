# Nombre que debe utilizar el backend del proyecto principal.
output "terraform_state_bucket" {
  description = "S3 bucket used by the Terraform backend"
  value       = aws_s3_bucket.terraform_state.id
}
