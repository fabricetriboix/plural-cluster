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

  sha     = "h1:9eFYQMy0TomrjmZrP7s9sKXK86hrC7Exj+abegFBTvA="
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

  sha     = "h1:9eFYQMy0TomrjmZrP7s9sKXK86hrC7Exj+abegFBTvA="
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

  sha     = "h1:9eFYQMy0TomrjmZrP7s9sKXK86hrC7Exj+abegFBTvA="
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

  sha     = "772095960d6a31ad7955c47fa683f0c525c4ec6aacf8960fdb9cd0bb44f7453d"
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

  sha     = "h1:JfprfWVkFcZpy1oMi3kI1Fan1ypmXE0WhP6U7ODRPOU="
  retries = 1
}
