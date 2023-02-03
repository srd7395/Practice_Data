variable "vnet" {
  type = string
  default = "vnet1"
}

variable "vnetaddress" {
  type = list
  default = ["17.0.0.0/16"]
}

variable "subnet" {
  type = string
  default = "subnet1"
}

variable "subnetaddress" {
  type = list
  default = ["17.0.0.0/24"]
}

variable "path" {
  default = "C:/Terraform_code/DataRG/terraform.tfstate"
}
