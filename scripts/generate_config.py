
# This script simulates an upstream system passing data to your infrastructure. It writes a JSON file that Terraform can natively read

import json
import os

def create_edge_config():
  # Simulate data
  config_data = {
    "device_id": "edge-node-01",
    "environment": "production",
    "internal_port": 80
  }
  # Ensure the directory exists and write JSON file for Terraform
  os.makedirs('terraform', exist_ok=True)
  with open('terraform/terraform.tfvars.json', 'w') as f:
    json.dump(config_data, f, indent=4)

  print("Step 1: Python successfully generated Terraform variables.")

if __name__ == "__main__":
  create_edge_config()
