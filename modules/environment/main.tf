locals {
  namespace = "${var.project}-${var.name}"
  domain    = "${var.name}.${var.base_domain}"
  labels = {
    "app.kubernetes.io/part-of" = var.project
    "portable-agent.io/env"     = var.name
  }
}

