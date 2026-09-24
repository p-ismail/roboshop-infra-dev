module "sg" {
    source = "../../terraform-aws-sg"
    project = var.project
    environment = var.environment
    sg_name = "mongodb" #creating the security group to the mongodb component
    vpc_id = local.vpc_id
  
}