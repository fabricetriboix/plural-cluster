metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:no5Lo3a2PrqFt1i2bCjRICC6hYiKYhf+OI3miXYGPsk="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ingress-nginx",
  ]

  sha     = "h1:no5Lo3a2PrqFt1i2bCjRICC6hYiKYhf+OI3miXYGPsk="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ingress-nginx",
  ]

  sha     = "603f529cb34dad7d485c83538e1c12cfccb1d7e1b110a0853f279996b9585f1e"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ingress-nginx/helm"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ingress-nginx",
  ]

  sha     = "h1:O8sYKUlNeWJfMG0Drx8eeSNSJW1Mx6ni7GE825g71B8="
  retries = 0
  verbose = false
}
