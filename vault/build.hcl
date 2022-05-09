metadata {
  name = "vault"
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
  path = "helm/vault"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "bdcfb31afcbc24806f660a59e343b3e2f9b006d6db30eac50c813c69a47e96ad"
    retries = 0
  }
}
