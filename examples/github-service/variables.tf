variable "owner" { type = string }
variable "name" { type = string }
variable "description" { type = string }
variable "team_id" { type = string }
variable "required_checks" {
  type        = list(string)
  description = "Точные названия checks, которые показывает GitHub после запуска CI."
}
variable "template" {
  type = object({
    owner      = string
    repository = string
  })
  default = null
}
