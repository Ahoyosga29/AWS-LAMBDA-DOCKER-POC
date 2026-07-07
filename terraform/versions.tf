# Configuración general de Terraform.
terraform {
  # Versión mínima de Terraform permitida para este proyecto.
  required_version = ">= 1.10.0"

  # Proveedores externos que necesita el proyecto.
  required_providers {
    # El proveedor AWS permite administrar recursos de Amazon.
    aws = {
      # Ubicación oficial del proveedor dentro del registro Terraform.
      source = "hashicorp/aws"

      # Permite actualizaciones compatibles dentro de la versión 6.
      version = "~> 6.0"
    }
  }
}