variable "organization" {

    type = string
}
variable "environment" {
   type = string
}
variable "app" {
    type = string
}

variable "tagging" {
    type = object ({ 
        Env= string
        Createdby = string
    })
}
variable "rgname" {
    
    type = string
    description = "resource group name"
}
variable "rglocation" {
   
    type = string
    description = "location"
}
variable "satype" {
    
    type = string
    description = "storage account type"
}
variable "diskname" {
    type = list
    description = "disk name"
}
variable "disksize" {
    type = number
    description = "disk size in gb"
}
