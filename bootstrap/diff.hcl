metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:RyRYJVH05xyI3oWs5R5JQ9Aj9vX9TdrJphZMNz9Vugo="
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

  sha     = "h1:RyRYJVH05xyI3oWs5R5JQ9Aj9vX9TdrJphZMNz9Vugo="
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

  sha     = "af2edf1ad879cdfbe9e0a906b7afcad7ee706c2eb260bd5c46fd74bce8ef915d"
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

  sha     = "h1:X/wHMlqe1KtlNJXtWA7rU8k7bn+3zDaZtZPOhjBqr+Q="
  retries = 0
  verbose = false
}
