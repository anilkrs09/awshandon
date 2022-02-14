data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20220131"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_ami_copy" "ubuntu_encrypted_ami" {
  name              = "ubuntu-encrypted-ami"
  description       = "An encrypted root ami based off ${data.aws_ami.ubuntu.id}"
  source_ami_id     = data.aws_ami.ubuntu.id
  source_ami_region = "us-east-1"
  encrypted         = true
  tags = { Name = "ubuntu-encrypted-ami" }
}

data "aws_ami" "encrypted-ami" {
  most_recent = true
  owners = ["self"]
  filter {
    name   = "name"
    values = [aws_ami_copy.ubuntu_encrypted_ami.name]
  }
  
}