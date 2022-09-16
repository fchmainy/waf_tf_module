terraform {
  required_providers {
    bigip = {
      source = "F5Networks/bigip"
      version = var.provider_version
    }
  }
}
