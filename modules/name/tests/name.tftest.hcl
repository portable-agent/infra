run "build_local_name" {
  command = plan

  variables {
    project     = "portable-agent"
    environment = "local"
    name        = "network"
  }

  assert {
    condition     = output.full_name == "portable-agent-local-network"
    error_message = "Модуль должен строить имя project-environment-name."
  }
}
