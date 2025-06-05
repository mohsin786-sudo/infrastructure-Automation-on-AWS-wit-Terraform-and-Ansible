# Define AWS Provider and Region
provider "aws" {
  region = var.aws_region
}

# Create a Security Group for SSH and HTTP
resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-web-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = var.vpc_id # Assuming you have a VPC defined or imported

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr] # Restrict SSH access
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For demo, ideally restrict
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 Instance
resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_pair_name
  security_groups = [aws_security_group.web_sg.name] # Referencing the SG above

  tags = {
    Name = "${var.project_name}-web-server"
  }
}

# --- Optional: Local-exec to generate Ansible Inventory ---
# This is one way to bridge Terraform and Ansible directly after provisioning.
# For robust production use, consider Ansible's dynamic inventory for AWS.
resource "null_resource" "ansible_inventory_generator" {
  depends_on = [aws_instance.web_server]

  provisioner "local-exec" {
    command = <<-EOT
      echo "[webservers]" > ansible_inventory.ini
      echo "${aws_instance.web_server.public_ip} ansible_user=${var.instance_ssh_user} ansible_ssh_private_key_file=${var.ansible_ssh_private_key_path}" >> ansible_inventory.ini
    EOT
  }
}