resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id" #creating the parameter store to store the vpc id 
  type  = "String"
  value = module.vpc.vpc_id
}
