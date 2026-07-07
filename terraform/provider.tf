# Configura el proveedor que Terraform usara para comunicarse con AWS.
provider "aws" {
  # La region se obtiene de la variable declarada en variables.tf.
  region = var.aws_region

  # Estas etiquetas se agregan automaticamente a los recursos compatibles.
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
