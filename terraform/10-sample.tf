provider "aws" {
  region = "us-east-1"
	profile = "automator"
}

resource "aws_instance" "tf-sample0" {
  	ami = "ami-04169656fea786776"
  	instance_type = "t2.nano"
		key_name = "alpha"
}
