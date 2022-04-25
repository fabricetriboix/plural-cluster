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

  sha     = "h1:Wv1tKcYmCnfo+nEx6NAqY8qjq+xEQBfz1s3OV1bmWx0="
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

  sha     = "h1:Wv1tKcYmCnfo+nEx6NAqY8qjq+xEQBfz1s3OV1bmWx0="
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

  sha     = "h1:Wv1tKcYmCnfo+nEx6NAqY8qjq+xEQBfz1s3OV1bmWx0="
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

  sha     = "81ee6062c300e9be00fa25d32e32c5b95cbec47318ff70f6257cef82fd78e98f"
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

  sha     = "h1:I8PGkEdWw1mi/fcxal0q28/3YHjJorATHsW5++Rt/84="
  retries = 1
}
