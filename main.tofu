provider "github" {
  token = var.token # o `GITHUB_TOKEN`
}

# Repositorio
resource "github_repository" "ejemploTerraform" {
  name        = "ejemploTerraform"
  description = "blank"
  visibility  = "public"

  template {
    owner                = "github"
    repository           = "terraform-template-module"
    include_all_branches = true
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
