terraform {
  required_providers {
  google = {
      source  = "hashicorp/google"
      version = "4.20.0"
    }
   kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
  }
}
}