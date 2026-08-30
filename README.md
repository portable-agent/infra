# Infra

Репозиторий хранит OpenTofu modules и их тесты для инфраструктуры Portable Agent. Здесь нет
бизнес-кода, секретов и настроек реального production.

## Текущий пакет

Первый пакет проверяет маленький модуль `name`. Он строит стабильное имя ресурса:

```text
portable-agent-local-network
```

Это учебный и инженерный контракт. Модуль пока не создаёт облачные ресурсы.

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
