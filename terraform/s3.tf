# Bucket donde la Lambda almacenara y leera objetos.
resource "aws_s3_bucket" "poc" {
  # Los nombres S3 deben ser unicos globalmente. La cuenta y el ambiente
  # reducen el riesgo de que otra persona ya haya utilizado el mismo nombre.
  bucket = "${var.project_name}-${var.environment}-${data.aws_caller_identity.current.account_id}"

  # Impide que Terraform elimine el bucket mientras contenga objetos.
  force_destroy = false
}

# Bloquea todas las formas de acceso publico al bucket.
resource "aws_s3_bucket_public_access_block" "poc" {
  bucket = aws_s3_bucket.poc.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Conserva versiones anteriores de objetos modificados o eliminados.
resource "aws_s3_bucket_versioning" "poc" {
  bucket = aws_s3_bucket.poc.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Cifra automaticamente todos los objetos almacenados en el bucket.
resource "aws_s3_bucket_server_side_encryption_configuration" "poc" {
  bucket = aws_s3_bucket.poc.id

  rule {
    apply_server_side_encryption_by_default {
      # AES256 usa claves administradas por Amazon S3.
      sse_algorithm = "AES256"
    }
  }
}
