module "networks" {
  source = "github.com/pandom/terraform-nsx-quickstart-module"

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

}
