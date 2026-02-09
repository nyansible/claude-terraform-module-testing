resource "aws_instance" "this" {

    ami                    = var.ami_id          # ← add this
    instance_type          = var.instance_type   # ← add this
    subnet_id              = var.subnet_id       # ← add this

    vpc_security_group_ids = var.security_group_ids # self gen
  
}