run "build_dev_environment" {
  command = plan
  variables {
    project     = "portable-agent"
    name        = "dev"
    base_domain = "example.test"
  }
  assert {
    condition     = output.namespace == "portable-agent-dev"
    error_message = "Namespace должен быть стабильным."
  }
  assert {
    condition     = output.domain == "dev.example.test"
    error_message = "Домен должен включать окружение."
  }
}

