# Region de AWS donde se administraran los recursos.
variable "aws_region" {
  description = "AWS region used by the project"
  type        = string
  default     = "us-east-1"
}

# Nombre base que utilizaremos para identificar los recursos.
variable "project_name" {
  description = "Base name used by AWS resources"
  type        = string
  default     = "lambda-poc"
}

# Ambiente que Terraform administrara.
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"

  # Solo aceptamos los ambientes definidos por el proyecto.
  validation {
    condition     = contains(["development", "production"], var.environment)
    error_message = "Environment must be development or production."
  }
}
