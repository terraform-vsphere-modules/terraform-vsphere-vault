
output "public_networks" {
  value = module.networks.public_networks
  sensitive = false
}

output "private_networks" {
  value = module.networks.private_networks
  sensitive = false
}