metadata {
  name = "monitoring"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/monitoring"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "591cdbd07a161f91327bedb35ef758ba957660ab9f3c9b564adda4bed23674b4"
    retries = 0
  }
}
