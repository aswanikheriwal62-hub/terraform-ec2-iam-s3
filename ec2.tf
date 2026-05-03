terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }
}


provider "aws" {
  region = "ap-south-1"
}



#_____________________creating IAM role________________________

resource "aws_iam_role" "ec2_role" {
    name = "ec2_s3_role"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


#____________________Policy attatch_________________ 

resource "aws_iam_role_policy_attachment" "s3_access" {
    role = aws_iam_role.ec2_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}


#________________ Instance Profile____________

resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2_profile"
    role = aws_iam_role.ec2_role.name
}


#__________________EC2 Instance___________________________

resource "aws_instance" "myserver" {
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t3.micro"
    subnet_id = "subnet-03a26c694ac7c20e1"

    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name


    tags = {
        Name = "Project-march-1"
    }
}


# ---------------- OUTPUT ----------------
output "aws_instance_public_ip" {
  value = aws_instance.myserver.public_ip
}

output "aws_instance_public_dns" {
  value = aws_instance.myserver.public_dns
}


#-------------_Backend block to upload file remote___________________
terraform {
    backend "s3" {
        bucket = "march-1-bucket"
        key = "backend.tfstate"
        region = "ap-south-1"
      
    }

}