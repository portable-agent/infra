output "name" {
  value       = github_repository.service.name
  description = "Созданный репозиторий."
}
output "url" {
  value       = github_repository.service.html_url
  description = "URL репозитория."
}

