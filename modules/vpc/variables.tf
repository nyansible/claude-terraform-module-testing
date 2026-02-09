variable "security_group_ids" {
    description = "List of security groups attached to EC2"
    type = list(string)
    default = []
  
}
