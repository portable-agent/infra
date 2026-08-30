$ErrorActionPreference = "Stop"

if (-not (Get-Command tofu -ErrorAction SilentlyContinue)) {
    throw "OpenTofu не найден. Установи версию из .opentofu-version или запусти проверку в CI."
}

& tofu fmt -check -recursive -diff .
if ($LASTEXITCODE -ne 0) {
    throw "tofu fmt нашёл неверное форматирование."
}

$modules = Get-ChildItem -LiteralPath "modules" -Directory
foreach ($module in $modules) {
    Push-Location $module.FullName
    try {
        & tofu init -backend=false -input=false -no-color
        if ($LASTEXITCODE -ne 0) {
            throw "tofu init завершился с ошибкой для $($module.Name)."
        }

        & tofu validate -no-color
        if ($LASTEXITCODE -ne 0) {
            throw "tofu validate завершился с ошибкой для $($module.Name)."
        }

        & tofu test -no-color
        if ($LASTEXITCODE -ne 0) {
            throw "tofu test завершился с ошибкой для $($module.Name)."
        }
    }
    finally {
        Pop-Location
    }
}

Write-Host "Все OpenTofu-модули прошли fmt, validate и test."
