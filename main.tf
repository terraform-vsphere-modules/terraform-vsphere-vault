locals {
  vsphere_data = var.vsphere_data[var.environment]
  networks = nonsensitive(data.tfe_outputs.networks.values.public_networks)
}


module "vault" {
  source            = "github.com/terraform-vsphere-modules/terraform-vsphere-virtual-machine"
  count             = var.count_index
  datacenter        = local.vsphere_data.datacenter
  cluster           = local.vsphere_data.cluster
  primary_datastore = local.vsphere_data.primary_datastore
  networks = {
    "${local.networks[count.index]}" : "dhcp"
    #"${data.tfe_outputs.networks.values.public_networks[count.index]}" : "dhcp"
    # "${module.networks.public_networks[count.index]}" : "dhcp"
  }
  # This will clone an existing packer template registered in vCenter
  template = "go-tfc-agent-small"

  hostname = "vault-${count.index}"
  memory   = 4096

}

module "ipam" {
  source            = "github.com/terraform-vsphere-modules/terraform-vsphere-virtual-machine"
  count             = var.count_index
  datacenter        = local.vsphere_data.datacenter
  cluster           = local.vsphere_data.cluster
  primary_datastore = local.vsphere_data.primary_datastore
  networks = {
    "${local.networks[count.index]}" : "dhcp"
    #"${data.tfe_outputs.networks.values.public_networks[count.index]}" : "dhcp"
    # "${module.networks.public_networks[count.index]}" : "dhcp"
  }
  # This will clone an existing packer template registered in vCenter
  template = "go-tfc-agent-small"

  hostname = "ipam-${count.index}"
  memory   = 4096

}

module "ldap" {
  source            = "github.com/terraform-vsphere-modules/terraform-vsphere-virtual-machine"
  count             = var.count_index
  datacenter        = local.vsphere_data.datacenter
  cluster           = local.vsphere_data.cluster
  primary_datastore = local.vsphere_data.primary_datastore
  networks = {
    "${local.networks[count.index]}" : "dhcp"
    #"${data.tfe_outputs.networks.values.public_networks[count.index]}" : "dhcp"
    # "${module.networks.public_networks[count.index]}" : "dhcp"
  }
  # This will clone an existing packer template registered in vCenter
  template = "go-tfc-agent-small"

  hostname = "ldap-${count.index}"
  memory   = 4096

}


