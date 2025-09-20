# Lab 01: Create an Azure Resource Group using Terraform

## Objective

In this lab, you'll set up a Terraform project in **VS Code** and use it to deploy your first **Azure Resource Group**. Make sure you are logged in to Azure CLI using the `az login` command.

## Steps

1. **Create the Lab Folder**
   - Create a new folder on your computer named: `terraform-lab-01-create-resource-group`
   - Open this folder in VS Code (File → Open Folder)

2. **Create Terraform Configuration File**
   - Inside VS Code, create a new file named: `main.tf`
   - This file will contain your Terraform code.

3. **Set Your Resource Group Name**
   - The resource group must follow this format: `rg-<yourname>-<org>-lab-01`
   - Example: `rg-rithin-msft-lab-01`

4. **Initialize Terraform**
   - Open the terminal in VS Code.
   - Run:
   ```bash
   terraform init
   ```

5. **Validate the Configuration**
   - Run:
   ```bash
   terraform validate
   ```

6. **Deploy the Resource Group**
   - Run:
   ```bash
   terraform plan
   terraform apply
   ```
   
7. **Confirm in Azure Portal**
   - Go to the Azure Portal and confirm the resource group has been created with the correct name and region.

## Deliverables

- A working main.tf file with the resource group defined.
- Successfully deployed Azure Resource Group using Terraform.


