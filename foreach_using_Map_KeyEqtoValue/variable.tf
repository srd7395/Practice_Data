variable "rgname" {
default= "rg01"
}     

variable "location" {
default= "West Europe"
 }
  
variable "vnetname" {
type = string
default = "vnet1"
}

variable "vnetaddress" {
 type = list
 default= ["18.0.0.0/16"]
 }

 variable "subnetnames" {
 type = map
 default = {
   websubnet = ["18.0.0.0/24"]
   appsubnet = ["18.0.1.0/24"]
   dbsubnet = ["18.0.2.0/24"]
 }
 }
