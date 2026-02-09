variable "security_group_ids" {
    description = "List of security groups attached to EC2"
    type = list(string)
    default = []
  
}
variable "ami_id" {
    description = "Testing making my own terraform module - ami Id"
    type = string
    default = "test val"
}

variable "instance_type" {
    description = "Test making my own terra moduel - Instance type"
    type = string
    default = "test val 2"
  
}
variable "subnet_id" {
    description = "Testing, subnet, needs to pull from other var"
    type = string
    default = "test val 3" 
}