target "docker-metadata-action" {}

variable "APP" {
  default = "kanidm-provision"
}

variable "VERSION" {
  // renovate: datasource=github-releases depName=m00nwtchr/kanidm-provision versioning=semver
  default = "0.0.1"
}

variable "SOURCE" {
  default = "https://github.com/m00nwtchr/kanidm-provision"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]

  dockerfile = "apps/kanidm-provision/Dockerfile"
  context    = "."


  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
