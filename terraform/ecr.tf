# Repositorio privado para las imagenes Docker de Lambda.
resource "aws_ecr_repository" "lambda" {
  # Ejemplo: lambda-poc-development.
  name = "${var.project_name}-${var.environment}"

  # Una etiqueta existente no podra reutilizarse para otra imagen.
  image_tag_mutability = "IMMUTABLE"

  # ECR revisara vulnerabilidades basicas despues de cada push.
  image_scanning_configuration {
    scan_on_push = true
  }

  # Cifra las imagenes almacenadas en ECR.
  encryption_configuration {
    encryption_type = "AES256"
  }
}

# Elimina automaticamente imagenes antiguas para limitar almacenamiento.
resource "aws_ecr_lifecycle_policy" "lambda" {
  repository = aws_ecr_repository.lambda.name

  # jsonencode convierte la estructura HCL en el JSON requerido por ECR.
  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep the 10 most recent images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }

        action = {
          type = "expire"
        }
      }
    ]
  })
}
