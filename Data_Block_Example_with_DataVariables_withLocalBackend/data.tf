data "terraform_remote_state" "tf" {
  backend = "local"

 config = {
    path = var.path #the path which resource group we want to use, give the path of terraform.tfstate
  }
}
