locals {
     common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = true
  }
    ami_id = data.aws_ami.joindevops.id
    #we will public subnet in 1a AZ
    public_subnet_ids = split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
    #converting string to list  and using only us-east-1a avalibility zone by using [0]
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}