resource "aws_route53_zone" "taakuuyaa-tk" {
  name = "taakuuyaa.tk"
}

resource "aws_route53_zone" "in" {
  name = "in.taakuuyaa"

  vpc {
    vpc_id = aws_vpc.vpc.id
    vpc_region = "ap-northeast-1"
  }

  tags = {
    Name = "Internal DNS"
  }
}

// web
resource "aws_route53_record" "web" {
  name = aws_route53_zone.taakuuyaa-tk.name
  type = "A"
  zone_id = aws_route53_zone.taakuuyaa-tk.id
  ttl = 300
  records = ["${aws_instance.web.public_ip}"]
}

resource "aws_route53_record" "web-in" {
  name = "web.in.taakuuyaa"
  type = "A"
  zone_id = aws_route53_zone.in.zone_id
  ttl = 300
  records = ["${aws_instance.web.private_ip}"]
}

// ap
resource "aws_route53_record" "ap-in" {
  name = "ap.in.taakuuyaa"
  type = "A"
  zone_id = aws_route53_zone.in.zone_id
  ttl = 300
  records = ["${aws_instance.ap.private_ip}"]
}

// rds
resource "aws_route53_record" "aurora-clstr-in" {
  name = "rds.in.taakuuyaa"
  type = "CNAME"
  zone_id = aws_route53_zone.in.zone_id
  ttl = 300
  records = ["${aws_rds_cluster.aurora-clstr.endpoint}"]
}

// rds-ro
resource "aws_route53_record" "aurora-clstr-ro-in" {
  name = "rds-ro.in.taakuuyaa"
  type = "CNAME"
  zone_id = aws_route53_zone.in.zone_id
  ttl = 300
  records = ["${aws_rds_cluster.aurora-clstr.reader_endpoint}"]
}
