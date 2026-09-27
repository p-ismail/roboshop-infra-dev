resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.mongodb_sg_id]
 

  tags = merge(
    {
        Name = "${var.project}-${var.environment}-mongodb"
    },
    local.common_tags
  )
}

#here after the launching the mongodb we are connecting to the mongodb host 
resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id #if the mongodb instance id was changed this trigger and reconfigure
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"#authentication
    password = "DevOps321"
    host        = aws_instance.mongodb.private_ip
  }

   #File provisioner block to copy a local configuration file
  provisioner "file" {
    source      = "bootstrap.sh"        # Path on your local machine
    destination = "/tmp/bootstrap.sh"         # Path on the remote machine
  }


  provisioner "remote-exec" {
    inline = [ #inline means we exceute multiple cmds
    "chmod+x bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh mysql"

     ]
  }
}


resource "aws_instance" "redis" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.redis_sg_id]
 

  tags = merge(
    {
        Name = "${var.project}-${var.environment}-redis"
    },
    local.common_tags
  )
}

 
resource "terraform_data" "redis" {
  triggers_replace = [
    aws_instance.redis.id 
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.redis.private_ip
  }

   #File provisioner block to copy a local configuration file
  provisioner "file" {
    source      = "bootstrap.sh"        # Path on your local machine
    destination = "/tmp/bootstrap.sh redis"         # Path on the remote machine
  }


  provisioner "remote-exec" {
    inline = [ #inline means we can exceute multiple cmds
    "chmod+x bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh"

     ]
  }
}


resource "aws_instance" "mysql" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_ids
  vpc_security_group_ids = [local.mysql_sg_id]
  iam_instance_profile = aws_iam_instance_profile.mysql.name
 

  tags = merge(
    {
        Name = "${var.project}-${var.environment}-mysql"
    },
    local.common_tags
  )
}

 
resource "terraform_data" "mysql" {
  triggers_replace = [
    aws_instance.mysql.id 
  ]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password = "DevOps321"
    host        = aws_instance.mysql.private_ip
  }

   #File provisioner block to copy a local configuration file
  provisioner "file" {
    source      = "bootstrap.sh"        # Path on your local machine
    destination = "/tmp/bootstrap.sh"         # Path on the remote machine
  }


  provisioner "remote-exec" {
    inline = [ #inline means we can exceute multiple cmds
    "chmod+x bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh mysql"

     ]
  }
}
