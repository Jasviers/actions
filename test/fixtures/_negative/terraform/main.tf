# Correctly formatted, but references an undeclared variable: `terraform validate` must fail.
output "greeting" {
  value = var.missing
}
