# Runbook

## OpenTofu не найден

Установите версию из `.opentofu-version` или запустите GitHub Actions.

## Ошибка format

Выполните `tofu fmt -recursive .`, проверьте diff и повторите тест.

## Ошибка init

Проверьте доступ к registry и не добавляйте локальную `.terraform` в Git.

## Ошибка test

Читайте имя run и текст assert. Исправляйте модуль или явно согласованный контракт, а не отключайте тест.
