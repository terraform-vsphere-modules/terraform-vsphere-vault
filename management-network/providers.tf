
terraform {
  required_providers {
    nsxt = {
      source  = "registry.terraform.io/vmware/nsxt"
      version = "3.2.9"
    }
    vsphere = {
      source  = "registry.terraform.io/hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "nsxt" {
  #host = var.nsx_server
}


provider "vsphere" {
  #vsphere_server = var.vsphere_server
  # Configuration options
}

