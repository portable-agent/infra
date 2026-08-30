output "namespace" {
  value       = local.namespace
  description = "Namespace окружения."
}
output "domain" {
  value       = local.domain
  description = "Домен окружения."
}
output "labels" {
  value       = local.labels
  description = "Обязательные Kubernetes labels."
}

