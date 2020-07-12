resource "aws_key_pair" "auth" {
  key_name = "terraformkey.pem"
  public_key = var.public_key
}

resource "aws_key_pair" "auth-app" {
  key_name = "terraform_ap_id_rsa.pub"
  public_key = var.app_public_key
}
