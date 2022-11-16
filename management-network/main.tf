module "networks" {
  source  = "app.terraform.io/burkey/quickstart-module/nsx"
  version = "0.0.4"

  environment = var.environment
  private_subnets = [
    "10.0.3.0/28",
    "10.0.3.16/28",
    "10.0.3.32/28"
  ]
  public_subnets = [
    "10.0.3.48/28",
    "10.0.3.64/28",
    "10.0.3.80/28"
  ]
  create_dhcp_server = true
}
