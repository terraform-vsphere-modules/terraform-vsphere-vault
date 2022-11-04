resource "nsxt_policy_group" "vault" {
  display_name = "vault"
  description  = "Terraform provisioned Group"

  criteria {
    external_id_expression {
      member_type  = "VirtualMachine"
      external_ids = module.vault.*.virtual_machine_id
    }
  }
}