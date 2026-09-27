resource "aws_security_group_rule" "bastion_internet" { #bastion accepecting connections from internet
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  # cidr_blocks       = ["0.0.0.0/0"]
  cidr_blocks       = [local.my_ipv4]
  #which SG you are creating this rule 
  security_group_id = local.bastion_sg_id 

}

resource "aws_security_group_rule" "mongodb_bastion" { #mongodb accepecting connections from bastion
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  #which SG you are creating this rule 
  security_group_id = local.mongodb_sg_id #allowing this sg instance through 22 port

}

resource "aws_security_group_rule" "mongodb_catalogue" { #mongodb accepecting connections from catalogue
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #where traffic is coming from
  source_security_group_id = local.catalogue_sg_id
  #which SG you are creating this rule 
  security_group_id = local.mongodb_sg_id

}

resource "aws_security_group_rule" "mongodb_user" { #mongodb accepecting connections from user
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  #where traffic is coming from
  source_security_group_id = local.user_sg_id
  #which SG you are creating this rule 
  security_group_id = local.mongodb_sg_id

}

resource "aws_security_group_rule" "redis_bastion" { #redis accepecting connections from bastion
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  #which SG you are creating this rule 
  security_group_id = local.redis_sg_id

}

resource "aws_security_group_rule" "mysql_bastion" { #mysql accepecting connections from bastion
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  #where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  #which SG you are creating this rule 
  security_group_id = local.mysql_sg_id

}
