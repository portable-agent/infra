# Infra

Репозиторий хранит OpenTofu modules и их тесты для инфраструктуры Portable Agent. Здесь нет
бизнес-кода, секретов и настроек реального production.

## Что готово

- `modules/name` строит стабильные имена;
- `modules/environment` задаёт namespace, domain и labels окружения;
- `modules/github-service` создаёт репу, доступ команды и ruleset;
- `examples/github-service` показывает запуск без токена в файлах.

```text
portable-agent-local-network
```

GitHub token передаётся провайдеру только через `GITHUB_TOKEN`. State, tfvars с реальными
значениями и секреты не коммитятся. Облачные ресурсы и production пока не создаются.
Необязательный вход `template` наполняет новую репу из GitHub template repo; адрес не зашит в модуль.

## Требования

- OpenTofu 1.12.6;
- PowerShell 7.

Проверка всех модулей:

```powershell
pwsh ./scripts/check-tofu.ps1
pwsh ./scripts/check-docs.ps1
```

Архитектура и следующий шаг описаны в [docs/index.md](docs/index.md). Правила для разработчиков и
AI-агентов находятся в [AGENTS.md](AGENTS.md).
