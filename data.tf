data "tfe_outputs" "networks" {
  organization = "burkey"
  workspace = "tf-vsphere-management-networks"
}
data "vsphere_datacenter" "dc" {
 name = local.vsphere_data.datacenter
}