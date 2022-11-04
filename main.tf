locals {
  vsphere_data = var.vsphere_data[var.environment]
}

module "vault" {
  source            = "github.com/terraform-vsphere-modules/terraform-vsphere-virtual-machine"
  count             = var.vault_machine_count
  datacenter        = local.vsphere_data.datacenter
  cluster           = local.vsphere_data.cluster
  primary_datastore = local.vsphere_data.primary_datastore
  networks = {
    "${data.tfe_outputs.networks.values.public_networks[count.index]}" : "dhcp"
    # "${module.networks.public_networks[count.index]}" : "dhcp"
  }
  # This will clone an existing packer template registered in vCenter
  template = "go-tfc-agent-small"

  hostname = "vault-${count.index}"
  memory   = 4096

}

# module "ldap" {
#   depends_on = [
#     module.networks
#   ]
#   source            = "github.com/terraform-vsphere-modules/terraform-vsphere-virtual-machine"
#   count             = "1"
#   datacenter        = data.datacenter.this.name
#   cluster           = data.cluster.this.name
#   primary_datastore = data.primary_datastore.this.name
#   networks = {
#     "${module.networks.public_networks[count.index]}" : "dhcp"
#     #"${module.networks.outputs.public_networks[count.index]}" : "dhcp"
#   }
#   # This will clone an existing packer template registered in vCenter
#   template = "go-tfc-agent-small"

#   hostname = "ldap-${count.index}"
#   memory   = 4096

# }

# module "ipam" {
#   depends_on = [
#     module.networks
#   ]
#   source            = "github.com/terraform-vsphere-modules/terraform-vsphere-virtual-machine"
#   count             = "1"
#   datacenter        = data.datacenter.this.name
#   cluster           = data.cluster.this.name
#   primary_datastore = data.primary_datastore.this.name
#   networks = {
#     "${module.networks.public_networks[count.index]}" : "dhcp"
#     #${module.networks.outputs.public_networks[count.index]}" : "dhcp"
#   }
#   # This will clone an existing packer template registered in vCenter
#   template = "go-tfc-agent-small"

#   hostname = "ipam-${count.index}"
#   memory   = 4096

# }


