metadata {
  path = "vault"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:T2Qwgd+21MGwOg1grBVgM7j1oBLJDEaSDbjEUQTHgjs="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:T2Qwgd+21MGwOg1grBVgM7j1oBLJDEaSDbjEUQTHgjs="
  retries = 1
}

step "terraform-output" {
  wkdir   = "vault"
  target  = "vault/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "vault",
  ]

  sha     = "h1:T2Qwgd+21MGwOg1grBVgM7j1oBLJDEaSDbjEUQTHgjs="
  retries = 0
}

step "kube-init" {
  wkdir   = "vault"
  target  = "vault/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "aad1b3c7bf7cc4dfff21c431a08128a9b79622cbc89dade11d3158600d3948db"
  retries = 0
}

step "crds" {
  wkdir   = "vault"
  target  = "vault/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "vault",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "vault"
  target  = "vault/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "vault",
  ]

  sha     = "h1:PSbxlLepMfwFMl6U/IDAoYCi3jhVZbykHFtKM8Skb0M="
  retries = 1
}
