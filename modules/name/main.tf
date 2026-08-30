terraform {
  required_version = ">= 1.12.0, < 1.13.0"
}

locals {
  full_name = join("-", [var.project, var.environment, var.name])
}
