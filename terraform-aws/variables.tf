variable "s3_bucket_name" {
	default = "terra-bucket-3394"
	description = "This is the unique name of the Bucket"
}

variable "instance_type" {
	default = "t2.micro"
	description = "This is the Instance Type"
}

variable "ami_id" {
	default = "ami-00bb6a80f01f03502"
}

variable "instance_name" {
	default = "terra-auto-instance"
	description = "This is the name of the Instance"
}

variable "aws_key_name" {
	default = "terra-key"
	description = "This is the name of the Key Pair"
}

variable "sg_name" {
	default = "allow-sh"
	description = "This is the name of the Security Group"
}
