resource "aws_s3_bucket" "demo-bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_instance" "demo_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
