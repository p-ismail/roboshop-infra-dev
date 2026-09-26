variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}


variable "sg_names" {

    type = list
    default =[
        #Database
        "mongodb" , "redis" , "mysql" , "rabbitmq",

        #Backend
        "catalogue" , "user" , "cart" , "shipping" , "payment" ,

        #Backend ALB
        "backend_alb",

        #frontend
        "frontend",

        #Frontend ALB
        "frontend_alb",

        #bastion
        "bastion",
    ]
  
}

