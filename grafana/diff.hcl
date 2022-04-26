metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tG4BSDmVWcvEtNXGoVnR6zIfIkKGuxucFBjwCjgqPe8="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:tG4BSDmVWcvEtNXGoVnR6zIfIkKGuxucFBjwCjgqPe8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "a64ea441fe39ef8117bc7003798901fe228ec927f5b42e6fe16caafc08fc3049"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:MZCK6R2GmuvGHgSAPH9QFZhzbLf7O4TJXhFzmI7m1+I="
  retries = 0
  verbose = false
}
