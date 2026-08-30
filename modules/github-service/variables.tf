variable "name" {
  type        = string
  description = "Имя репозитория сервиса."
  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,62}$", var.name))
    error_message = "name должен содержать маленькие латинские буквы, цифры и дефисы."
  }
}
variable "description" {
  type        = string
  description = "Короткое публичное описание назначения сервиса."
  validation {
    condition     = length(trimspace(var.description)) >= 10
    error_message = "description должен объяснять назначение сервиса."
  }
}
variable "team_id" {
  type        = string
  description = "ID GitHub team, которая поддерживает сервис."
}
variable "visibility" {
  type        = string
  default     = "public"
  description = "Видимость репозитория."
  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "visibility должна быть public, private или internal."
  }
}
variable "topics" {
  type        = list(string)
  default     = ["portable-agent", "microservice"]
  description = "GitHub topics."
}
variable "required_checks" {
  type        = list(string)
  description = "Точные названия обязательных GitHub checks из первого успешного запуска CI."
  validation {
    condition     = length(var.required_checks) > 0
    error_message = "Нужен хотя бы один обязательный check."
  }
}
variable "allow_force_push" {
  type        = bool
  default     = false
  description = "Разрешить force push в main. По умолчанию запрещён."
}
variable "template" {
  type = object({
    owner      = string
    repository = string
  })
  default     = null
  description = "Необязательная GitHub template repo. Если не задана, создаётся только README."
}
