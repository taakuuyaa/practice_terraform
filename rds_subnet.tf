resource "aws_db_subnet_group" "db-subgrp" {
  name = "db-dubgrp"
  subnet_ids = ["${aws_subnet.dbsub-a.id}", "${aws_subnet.dbsub-c.id}"]

  tags = {
    Name = "db-subnet-group"
  }
}
