# Lee la identidad de la cuenta autenticada actualmente.
# Un bloque data consulta informacion: no crea recursos.
data "aws_caller_identity" "current" {}

# Lee la region configurada en el proveedor AWS.
data "aws_region" "current" {}
