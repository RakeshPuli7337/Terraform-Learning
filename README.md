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


<pre> ```text terraform.tfvars ↓ variables.tf (root module) ↓ main.tf (root module calls modules) ↓ module variables.tf ↓ module main.tf (resource) ``` </pre>

