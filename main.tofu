variable "token" {
  description = "GitHub Token"
  type        = string
  sensitive   = true
}

provider "github" {
  token = var.token # o `GITHUB_TOKEN`
}

# Repositorio
resource "github_repository" "ejemploTerraform" {
  name        = "ejemploTerraform"
  description = "blank"
  visibility  = "public"
  allow_auto_merge = false
  allow_merge_commit = true
  allow_rebase_merge = true
  allow_squash_merge = false

   # Usar un template para crear el repositorio
  template {
    owner = "dvillamor0"
    repository = "labTerraform"
  }
}

# Ramas
resource "github_branch" "development" {
  repository = github_repository.ejemploTerraform.name 
  branch     = "desarrollo"

  depends_on = [github_repository.ejemploTerraform]
}

resource "github_branch" "build" {
  repository = github_repository.ejemploTerraform.name
  branch     = "build"

  depends_on = [github_repository.ejemploTerraform]
}

resource "github_branch" "releases" {
  repository = github_repository.ejemploTerraform.name 
  branch     = "releases"

  depends_on = [github_repository.ejemploTerraform]
}
