# Nombre del bucket que consumira la Lambda.
output "s3_bucket_name" {
  description = "S3 bucket used by the Lambda function"
  value       = aws_s3_bucket.poc.id
}

# Direccion completa donde publicaremos las imagenes Docker.
output "ecr_repository_url" {
  description = "ECR repository URL for Lambda images"
  value       = aws_ecr_repository.lambda.repository_url
}
