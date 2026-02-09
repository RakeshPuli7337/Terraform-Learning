# Terraform-Learning

This repository contains Terraform configurations to create a single VM in Azure.

## Structure

- **env/dev/**: Development environment
  - `provider.tf` → Azure provider configuration
  - `main.tf` → Calls modules for VM and network
  - `variables.tf` → Environment-specific variable definitions
  - `tf.vars` → Environment-specific variable values

- **modules/**: Reusable Terraform modules
  - `network/` → Virtual network module
  - `vm/` → Virtual machine module

## Notes

- `.terraform/` folders and provider binaries are ignored in Git.
- `terraform.lock.hcl` is committed to lock provider versions.
- Sensitive files (like SSH keys or `.tfvars` containing secrets) are **not** included.

terraform.tfvars
      |
      v
variables.tf (root module)
      |
      v
main.tf (root module calls modules)
      |
      v
module variables.tf
      |
      v
module main.tf (resource)



This repository contains Terraform configurations to create a single VM in Azure using reusable modules and environment-specific configurations.
The design emphasizes modularity, variable-driven infrastructure, and clean refactoring.

📁 Structure
Terraform-Learning/
├─ env/dev/                     # Development environment
│  ├─ provider.tf               # Azure provider configuration
│  ├─ main.tf                   # Calls modules for VM and network
│  ├─ variables.tf              # Environment-specific variable declarations
│  └─ terraform.tfvars          # Environment-specific variable values
│
├─ modules/                     # Reusable Terraform modules
│  ├─ network/                  # Virtual network module
│  │   ├─ main.tf
│  │   ├─ variables.tf
│  │   └─ outputs.tf
│  └─ vm/                       # Virtual machine module
│      ├─ main.tf
│      ├─ variables.tf
│      └─ outputs.tf
│
├─ .gitignore
├─ README.md
└─ terraform.lock.hcl           # Provider version lock

⚡ Modules
1️⃣ Network Module

Creates Virtual Network, Subnets, and Network Interfaces (NICs)

Fully parameterized: vnet_name, subnet_name, address_space, nic_name

2️⃣ VM Module

Creates Linux Virtual Machine

Fully parameterized: vm_name, vm_size, os_image, storage_account_type, network_interface_id

OS image is defined as an object, allowing flexible multi-field configuration.

🎯 Next Steps (Planned)

Add second VM with different configuration

Convert modules to for_each for multiple VM/NICs

Introduce auto-shutdown for free-tier cost saving

Add NSG rules for network security