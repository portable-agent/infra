variable "project" {
  type        = string
  description = "Короткое имя проекта."
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]+$", var.project))
    error_message = "project должен быть DNS-именем."
  }
}

variable "name" {
  type        = string
  description = "Имя окружения: local, dev или stage."
  validation {
    condition     = contains(["local", "dev", "stage"], var.name)
    error_message = "Разрешены только local, dev и stage."
  }
}

variable "base_domain" {
  type        = string
  description = "Базовый домен без протокола. Может быть тестовым."
  validation {
    condition     = can(regex("^[a-z0-9.-]+$", var.base_domain))
    error_message = "base_domain содержит недопустимые символы."
  }
}

