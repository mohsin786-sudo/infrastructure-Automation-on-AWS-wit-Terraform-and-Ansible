# infrastructure-Automation-on-AWS-wit-Terraform-and-Ansible

# Infrastructure Automation on AWS using Terraform and Ansible

This project demonstrates how to automate infrastructure provisioning using *Terraform* and configure servers using *Ansible* on AWS Cloud. It provisions an EC2 instance, sets up SSH and HTTP access, and installs *Docker* and *Nginx* on the server.

---

##  Tech Stack

| Tool        | Purpose                                |
|-------------|----------------------------------------|
| Terraform   | Infrastructure provisioning (EC2, SG)  |
| Ansible     | Configuration management (Docker, Nginx) |
| AWS         | Cloud provider (EC2, VPC, Security Group) |
| Git & GitHub| Version control and source code hosting |

---

##  Project Structure

```bash
infra-automation/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
└── ansible/
    ├── inventory.ini
    └── playbook.yml
