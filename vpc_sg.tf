resource "aws_security_group" "pub-a" {
  // "sg-"のプレフィックスがつくとエラーになる
  name = "sg_pub-a"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "sg-pub-a"
  }
}

resource "aws_security_group_rule" "sg-egress-pub-a" {
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.pub-a.id
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress-pub-a-22" {
  from_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.pub-a.id
  to_port = 22
  type = "ingress"
  cidr_blocks = ["${var.my_global_ip}/32"]
}

resource "aws_security_group_rule" "ingress-pub-a-80" {
  from_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.pub-a.id
  to_port = 80
  type = "ingress"
  cidr_blocks = ["${var.my_global_ip}/32"]
}

resource "aws_security_group" "priv-a" {
  name = "sg_priv-a"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "sg-priv-a"
  }
}

resource "aws_security_group_rule" "priv-a" {
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.priv-a.id
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress-priv-a-22" {
  from_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.priv-a.id
  to_port = 22
  type = "ingress"
  cidr_blocks = ["10.0.1.0/24"]
}

resource "aws_security_group" "rds-sg" {
  name = "rds-sg"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_security_group_rule" "egress-rds-sg" {
  from_port = 0
  protocol = "-1"
  security_group_id = aws_security_group.rds-sg.id
  to_port = 0
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress-rds-3306" {
  from_port = 3306
  protocol = "tcp"
  security_group_id = aws_security_group.rds-sg.id
  to_port = 3306
  type = "ingress"
  cidr_blocks = ["10.0.2.0/24"]
}
