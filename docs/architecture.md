# Архитектура

```text
test -> OpenTofu module -> output
```

Первый модуль не вызывает облачный API. Это позволяет проверить формат, структуру и тестовый pipeline до
выбора реального provider.

`infra` создаёт базовые ресурсы. `deploy` устанавливает приложения в уже подготовленное окружение.
# Архитектура

```text
описание сервиса -> github-service -> repo + team + quality rules
окружение        -> environment    -> namespace + domain + labels
```

Модули маленькие и тестируются через `tofu test`. GitHub provider в тестах заменён mock provider,
поэтому pull request не создаёт реальные репозитории. Реальное применение требует отдельного
ручного шага и токена из окружения.
