metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:G6BN/dO5VGLxhey53L1+8al/zMJzEXRoXiz/dXV6nRM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:G6BN/dO5VGLxhey53L1+8al/zMJzEXRoXiz/dXV6nRM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "a25175a8f3afb6c77df86de106fb7e0fae081f54068989c92946c8e386f40563"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:9b2t2I1W7H3k9jVvyGOWYtKXLmTy5X8inJ+WNhW8D9U="
  retries = 0
  verbose = false
}
