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
- Terraform → Creates infrastructure (S3 bucket, EC2 instance, IAM role)
- S3 Backend → Stores Terraform state remotely
- EC2 Instance → Uses IAM Role for AWS access
- IAM Role → Grants permissions to access S3
- IAM Policy → Defines allowed actions (S3 access)
- Instance Profile → Attaches IAM Role to EC2

IAM Role Block :

This block creates an IAM Role.
It defines **who can assume this role** (trust relationship).
In this case, we allow the EC2 service (`ec2.amazonaws.com`) to assume the role.
👉 Meaning: EC2 instances are allowed to use this IAM role.

Policy Attatch Block :

In this block we attach policy to above IAM Role to grant access to S3 service

Instance Profile Block :

It acts as a bridge between IAM Role and EC2 instance
Meaning: EC2 cannot directly use IAM Roles, so the Instance Profile attaches the role to EC2.
