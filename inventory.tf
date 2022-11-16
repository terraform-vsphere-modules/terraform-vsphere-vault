resource "vsphere_tag_category" "managed" {
  name        = "terraform:managed"
  description = "Category for IaC:Terraform"
  cardinality = "SINGLE"

  associable_types = [
    "VirtualMachine",
    "Datastore",
    "VirtualApp",
    "HostNetwork",
    "Network",
    "OpaqueNetwork",
    "Datacenter",
    "Folder",

  ]
}
resource "vsphere_tag" "managed" {
  name = "managed"
  category_id = "${vsphere_tag_category.managed.id}"
  description = "Managed by Terraform"
}

resource "vsphere_folder" "private" {
  path          = "private-cloud"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "management" {
  path          = "${vsphere_folder.private.path}/management-machines"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}