# Usa la region y las credenciales recibidas desde la terminal.
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project   = "lambda-poc"
      ManagedBy = "Terraform"
      Purpose   = "TerraformState"
    }
  }
}
