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

  sha     = "h1:y1jMioGGe9v4egWtc9XW2fSgZ8E/JT8gTUm1aqCZDsM="
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

  sha     = "h1:y1jMioGGe9v4egWtc9XW2fSgZ8E/JT8gTUm1aqCZDsM="
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

  sha     = "h1:y1jMioGGe9v4egWtc9XW2fSgZ8E/JT8gTUm1aqCZDsM="
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

  sha     = "5c27f1b1058b807d3361d6b42a05a52b62c533a91a19c565cbc2aa3e81e5d8e7"
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

  sha     = "h1:4GHUQBt8sBxtyIqgcxVHI6tlTvkyHjfzeWq9AWMcaG0="
  retries = 1
}
