
# terraform {
# #   cloud {
# #     organization = "burkey"
# #     workspaces {
# #       #tags = ["vsphere","google","seasia"]
# #       name = "tf-vsphere-local"
# #     }
# #   }
#   required_providers {
#     nsxt = {
#       source  = "vmware/nsxt"
#       version = "~>3.2"
#     }
#     vsphere = {
#       source  = "hashicorp/vsphere"
#       version = "2.2.0"
#     }
#   }
# }

# provider "nsxt" {
#   #host = var.nsx_server
# }


# provider "vsphere" {
#   #vsphere_server = var.vsphere_server
#   # Configuration options
# }

