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
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "b749c7f640cb690e0053e14176c35e40384e1db15a43ca05119df3e1ba21db7f"
    retries = 0
    verbose = false
  }
}
