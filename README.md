# poc_Terraform
Simulation an edge gateway device provisioning using Terraform and Ansible

# 1. Run Python to generate data
python scripts/generate_config.py

# 2. Let Terraform provision the infrastructure
cd terraform
terraform init
terraform apply -auto-approve

# 3. Let Ansible configure the infrastructure
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
