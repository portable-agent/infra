mock_provider "github" {
  mock_resource "github_repository" {
    defaults = {
      html_url = "https://github.com/example/sample-service"
    }
  }
}

run "build_public_service" {
  command = plan
  variables {
    name            = "sample-service"
    description     = "Тестовый сервис для проверки фабрики."
    team_id         = "123"
    required_checks = ["test", "security"]
  }
  assert {
    condition     = github_repository.service.visibility == "public"
    error_message = "Open source репозиторий должен быть public по умолчанию."
  }
  assert {
    condition     = github_repository.service.delete_branch_on_merge
    error_message = "Ветки должны удаляться после merge."
  }
  assert {
    condition     = github_team_repository.maintainers.permission == "maintain"
    error_message = "Команда должна получить maintain."
  }
}
