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

  sha     = "h1:AsV/Al0ZlC6D+V9UL0Mdw6sWCFhhpZJw5s9nMg1rpyo="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:AsV/Al0ZlC6D+V9UL0Mdw6sWCFhhpZJw5s9nMg1rpyo="
  retries = 1
  verbose = false
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

  sha     = "h1:AsV/Al0ZlC6D+V9UL0Mdw6sWCFhhpZJw5s9nMg1rpyo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "vault"
  target  = "vault/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a8765f753b9a661a99c3e884d5a7d4b63cced79b4b6d587563cbf10d9a6ecb46"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:P1J/489aX1RbMQN6dto0dPLz/X+On17a3r4KHuPAhnw="
  retries = 1
  verbose = false
}
