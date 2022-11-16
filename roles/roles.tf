# data "vsphere_role" "terraform_role" {
#   label = "Administrator"
#   name = "Administrator"
# }

# resource "vsphere_role" "burkey" {
#     #role_privileges = data.vsphere_role.terraform_role.role_privileges
#     role_privileges = ["Alarm.Acknowledge", "Alarm.Create"]
#     name = "administrator-burkey"
# }