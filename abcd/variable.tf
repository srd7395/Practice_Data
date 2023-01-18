variable "organization" {

    type = string
}
variable "environment" {
   type = string
}
variable "app" {
    type = string
}
variable "tier" {
    type = string
}
variable "tagging" {
    type = object ({ 
        CreatedBy = string
        CostCenter = number
        Org = string
    })
}
variable "rgname" {
    
    type = string
    description = "resource group name"
}
variable "loc" {
   
    type = string
    description = "location"
}
variable "vnet_name" {
    
    type = string
    description = "vnet name"
}
variable "vnet_address" {
    type = list
    description = "vnet address"
}
variable "subnet_name" {
    type = string
    description = "subnet name"
}
variable "subnet_address" {
    type = list
    description = "subnet address"
}
variable "nic" {
    type = string
    description = "network interface"
}
variable "pip" {
    type = string
    description = "public ip"
}
variable "NSG" {
    type = string
    description = "network security group"
} 
 
variable "vmname" {
    type = string
    description = "vm name"
}

