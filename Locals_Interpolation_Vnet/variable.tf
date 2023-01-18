variable "env" {
  default = "dev"
}
variable "app" {
  default = "java"
}
variable "tier" {
  default = "web"
}
variable "rgname" {
  type = string
  default = "Interpolation"
}
variable "location" {
    type = string
    default = "East US"
}
variable "vnetname" {
    type = string
    default = "vnet"   
}
variable "subnet1" {
	default = "subnet1"
}
variable "subnet2" {
	default = "subnet2"
}
variable "subnet3" {
	default = "subnet3"
}
  
