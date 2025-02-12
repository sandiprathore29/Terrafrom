# AWS Infrastructure with Terraform

![image](https://github.com/user-attachments/assets/eb5cc7ff-7e7b-4b15-a73a-314ab1010e9b)



This repository contains Terraform code to set up an AWS infrastructure, including a VPC with public and private subnets, an bastion-host server, a back end server, and necessary networking components.

#### Project Structure

instance.tf - Defines EC2 instances for the bastion-host server and  back end server.

provider.tf - Specifies AWS provider configuration.

security_group.tf - Defines security groups for EC2 instances.

variable.tf - Contains input variables for the Terraform configuration.

vpc_config.tf - Configures VPC, subnets, and networking components.

#### Prerequisites

Before deploying the infrastructure, ensure you have:

Terraform installed

An AWS account with necessary permissions

AWS credentials (Access Key, Secret Key and Region)

A private key for SSH access to EC2 instances

#### Configuration

Update AWS Credentials

Modify provider.tf with your AWS credentials and region:

provider "aws" {
  access_key = "your-access-key"
  secret_key = "your-secret-key"
  region     = "your-region"
}

Update Private Key Name

Modify variable.tf to set your private key name:


variable "private_pam_key" {
  type    = string
  default = "your-private-key"
}


#### Deployment

Initialize Terraform:

terraform init

Preview changes:

terraform plan

Apply changes:

terraform apply 

Destroying the Infrastructure

To remove all resources created by Terraform:

terraform destroy 

#### Notes

Ensure your AWS credentials have sufficient permissions to create and manage VPCs, EC2 instances, and security groups.

The back end server is in a private subnet and can only be accessed via the NAT Gateway.

The bastion-host server is in a public subnet with internet access through an Internet Gateway.
