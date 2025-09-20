variable resource_group_name {}
variable location {}
variable vnet {}
variable subnet {}
variable vm_zones {
  default = {
    vm_az1 = 1
    vm_az2 = 2
    vm_az3 = 3
  }
}
