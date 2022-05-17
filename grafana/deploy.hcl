metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:f0CrF98o85FgsEvIdRy4eRvlt2geoXkj8CLI9eKFhq0="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:f0CrF98o85FgsEvIdRy4eRvlt2geoXkj8CLI9eKFhq0="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana",
  ]

  sha     = "h1:f0CrF98o85FgsEvIdRy4eRvlt2geoXkj8CLI9eKFhq0="
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
  ]

  sha     = "3af272250d1c672e14becf3453f6e0e164f7889f802e65563d88b43bab54a21f"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha     = "h1:sAOttTgCcZOhYsEqxBOXWbFBlqdhQmuKOl/Cuyz7l4I="
  retries = 1
  verbose = false
}
