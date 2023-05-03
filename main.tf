terraform {
  required_version = ">= 1.1.0"

  backend "local" {
    path = "terraform.tfstate"
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.0.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.api_private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
}
