terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.13"
    }
  }
}

provider "github" {
  owner = var.owner
}

module "service" {
  source          = "../../modules/github-service"
  name            = var.name
  description     = var.description
  team_id         = var.team_id
  required_checks = var.required_checks
  template        = var.template
}
