# terraform-ec2-iam-s3
Terraform project for EC2 with IAM role and S3 remote state backend

Description
This project demonstrates how to provision an AWS EC2 instance using Terraform with IAM role-based S3 access and remote state management using S3 backend.

Component Used
- Terraform
- AWS EC2
- IAM (Roles & Policies)
- S3 (Remote State Backend)

Architecture
- Terraform → Creates EC2
- EC2 → Uses IAM Role
- IAM Role → Grants S3 Access
- Terraform State → Stored in S3 Backend

What this project does
- Creates EC2 instance using Terraform
- Attaches IAM role to EC2
- Grants EC2 access to S3
- Stores Terraform state remotely in S3
