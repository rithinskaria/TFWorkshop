# Lab 04: Working with Variables and Provider Version Constraints

## Objective

In this lab, you will:

- Manually create a resource group using `az group create`.
- Define two independent Azure resources in Terraform.
- Pass all arguments using **variables**.
  - One variable will have a **default value**.
  - One will be passed via `terraform.tfvars`.
  - One will be **prompted interactively**.

## Folder Naming Convention

Use: `terraform-lab-04-variables-provider-version`

## Prerequisites

1. **Azure CLI installed and authenticated**
2. **Terraform installed**
3. **Manual Resource Group Creation**

## Steps

1. **Create the Resource Group Manually**
   ```bash
   az group create --name rg-<yourname>-<org>-lab-04 --location eastus
   ```
   Replace `<yourname>` with your name.

2. **Create the Folder and Files in VS Code**
   - Folder: `terraform-lab-04-variables-provider-version`
   - Files to create:
     - `main.tf`
     - `variables.tf`
     - `terraform.tfvars`

3. **main.tf Contents (Overview)**
   Key features:
   - Enforces azurerm provider version > 4.26.
   - Create Azure Log Analytics and Azure Public IP
   - All arguments passed via variables

4. **variables.tf Expectations**
   - Variable 1: `resource_group_name` → Set via `terraform.tfvars`
   - Variable 2: `location` → Set with a **default value (e.g., eastus)**
   - Variable 3: `sku_name` (for Log Analytics Workspace) → Prompted interactively

5. **What to Do**
   1. Write the Terraform code to:
      - Create a **Log Analytics Workspace**
      - Create a **Public IP Address**
      - Use only variables for every argument (no hardcoded values)
   2. Use:
      - Default value for location (e.g., eastus)
      - `.tfvars` for resource_group_name
      - Interactive prompt for something like sku_name
   3. Run the following commands in sequence:
      ```bash
      terraform init
      terraform validate
      terraform plan
      terraform apply
      ```
   4. Confirm resources in the Azure Portal under the resource group.


## Deliverables

- `main.tf`, `variables.tf`, `terraform.tfvars`
- Successful deployment of **two independent Azure resources**
- Verified use of all three variable sources (default, tfvars, and interactive prompt)


