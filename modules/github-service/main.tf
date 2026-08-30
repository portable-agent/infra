resource "github_repository" "service" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  allow_auto_merge       = true
  allow_merge_commit     = false
  allow_rebase_merge     = false
  allow_squash_merge     = true
  delete_branch_on_merge = true
  auto_init              = var.template == null
  topics                 = sort(distinct(var.topics))

  dynamic "template" {
    for_each = var.template == null ? [] : [var.template]
    content {
      owner                = template.value.owner
      repository           = template.value.repository
      include_all_branches = false
    }
  }
}

resource "github_repository_vulnerability_alerts" "service" {
  repository = github_repository.service.name
}

resource "github_team_repository" "maintainers" {
  team_id    = var.team_id
  repository = github_repository.service.name
  permission = "maintain"
}

resource "github_repository_ruleset" "main" {
  name        = "main-quality-gate"
  repository  = github_repository.service.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      exclude = []
      include = ["~DEFAULT_BRANCH"]
    }
  }

  rules {
    creation                = true
    deletion                = true
    non_fast_forward        = !var.allow_force_push
    required_linear_history = true
    required_signatures     = false

    pull_request {
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = true
      require_last_push_approval        = false
      required_approving_review_count   = 1
      required_review_thread_resolution = true
    }

    required_status_checks {
      strict_required_status_checks_policy = true
      dynamic "required_check" {
        for_each = toset(var.required_checks)
        content {
          context = required_check.value
        }
      }
    }
  }
}
