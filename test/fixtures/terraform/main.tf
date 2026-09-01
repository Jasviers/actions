terraform {
  required_version = ">= 1.5.0"
}

variable "greeting" {
  description = "Greeting used to prove terraform fmt/validate/tflint pass against this fixture."
  type        = string
  default     = "hello from actions test fixture"
}

output "greeting" {
  value = var.greeting
}
