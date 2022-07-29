metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:g2Y1oszzNfiIY84L4YteDf9cd6c5z8sMn6uc6dmbisU="
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

  sha     = "h1:g2Y1oszzNfiIY84L4YteDf9cd6c5z8sMn6uc6dmbisU="
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

  sha     = "3bf8c68d58f7ef49247b6c3617b8a00c6fe5d5c87825b0ed31781e1935b0aa06"
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

  sha     = "h1:MAdGRzuOXw6swbis2W5PIWUJT1CZ5qQtsx8vM2Qe4/Q="
  retries = 0
  verbose = false
}
