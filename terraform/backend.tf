# Almacena el estado del proyecto principal en S3.
terraform {
  backend "s3" {
    bucket  = "lambda-poc-terraform-state-363661057779"
    key     = "development/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true

    # Crea un archivo de bloqueo en S3 para impedir dos applies simultaneos.
    use_lockfile = true
  }
}
