resource "vsphere_folder" "private" {
  path          = "private-cloud"
  type          = "vm"
  datacenter_id = local.vsphere_data.datacenter
}

resource "vsphere_folder" "management" {
  path          = "${vsphere_folder.private.path}/management-machines"
  type          = "vm"
  datacenter_id = local.vsphere_data.datacenter
}