variable "rgname" {
  type = string
  default = "test2"
  description = "this is resource group name for managed disk"
}
variable "rglocation" {
    type = string
    default = "East US"
     description = "this is location name for managed disk"
}
variable "diskname" {
    type = string
    default = "disk1"
     description = "this is disk name for managed disk"
}
variable "satype" {}
variable "disksize" {}
  
