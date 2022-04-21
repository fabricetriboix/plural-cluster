metadata {
  path = "vault"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "vault",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "vault"
  target  = "vault/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "vault",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "vault/helm"
  target  = "vault/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "vault",
  ]

  sha     = ""
  retries = 0
}
