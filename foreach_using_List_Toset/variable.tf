variable "rgname" {
default= "diskrg01"
}     

variable "location" {
default= "West Europe"
}
  
variable "diskname" {
    type = list
  default = ["osdisk", "newdisk", "ddrive", "logsdisk", "backupdrive"]
}
