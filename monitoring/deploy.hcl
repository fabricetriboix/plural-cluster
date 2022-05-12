metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:tp/PdxI6aL/kG/GYq54P23sJngDgVWRQVYPpqqMMub0="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:tp/PdxI6aL/kG/GYq54P23sJngDgVWRQVYPpqqMMub0="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:tp/PdxI6aL/kG/GYq54P23sJngDgVWRQVYPpqqMMub0="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7977ad250ff949512554d23b6ea1be819ba591e4aba66b60489d3bdda2bd27c5"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:2uZZjww2jPGQCg0m3pDOu9HOuIbNZUe8Ll8m3n1J2Zs="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:LoskSdTz+USmWi5aDltQ6Fh2SDTEmFGMF3jsqyyl/TM="
  retries = 1
}
