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

  sha     = "h1:Kr6V2KMncIRkDhIkGPY5NpiPNG6h5F9cTO/8WvOrKcI="
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

  sha     = "h1:Kr6V2KMncIRkDhIkGPY5NpiPNG6h5F9cTO/8WvOrKcI="
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

  sha     = "h1:Kr6V2KMncIRkDhIkGPY5NpiPNG6h5F9cTO/8WvOrKcI="
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

  sha     = "63c884ee84ce6a6209f16fb983dfe72ebe970c25f3cdcc48da49a9995249f0f0"
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

  sha     = "h1:/6hbyKHoirivWz2+B/+AqzsZQrVwG5ImfTUn5fD+2uI="
  retries = 1
}
