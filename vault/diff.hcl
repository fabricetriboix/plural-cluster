metadata {
  path = "vault"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:l6INMYmg5detU6O9WN3ELVM1BUIEL3q2OBOvxUYGKoM="
  retries = 0
  verbose = false
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

  sha     = "h1:l6INMYmg5detU6O9WN3ELVM1BUIEL3q2OBOvxUYGKoM="
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
    "vault",
  ]

  sha     = "9302aace2dbb49607359e454bdb8618ea895bddc8d5d0187697c3ed60f7a1b5e"
  retries = 0
  verbose = false
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

  sha     = "h1:PRFqh54dWEwxefuqbNvxxz7Lp8Z2SIs2Sn0zdDHPgRg="
  retries = 0
  verbose = false
}
