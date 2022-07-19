metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:E9dzYGTUzkTILeRFFqaVal61KMAZ+a8nodR8HtFsbCg="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:E9dzYGTUzkTILeRFFqaVal61KMAZ+a8nodR8HtFsbCg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "9cefdaf84645bdf50d0beb8e9f00946f84ca7376b396b9da2868c5c974a86b0c"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:X4OH7/svW8UTgllETf3+/P8zttR/Ta40dleJfUB8Oz4="
  retries = 0
  verbose = false
}
