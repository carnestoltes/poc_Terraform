# Define variables matching the JSON keys from Python
variable "device_id" { type = string }
variable "environment" { type = string }
variable "internal_port" { type = number }

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# Create a container
resource "docker_container" "edge_node" {
  name  = var.device_id
  image = "ubuntu:22.04"
  start = true
  command = ["sleep", "infinity"] # Keeps container running
  
  ports {
    internal = var.internal_port
    external = 8080
  }
}

# Crucial Bridge: Terraform creates the Inventory file for Ansible
resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<EOT
[edge_nodes]
${docker_container.edge_node.name} ansible_connection=docker
EOT
}
