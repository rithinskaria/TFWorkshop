# Capstone Lab: Deploying an Azure Web App with Key Vault and Managed Identity (Group Project)

## Lab Objective

You will create a secure, production-ready Azure PaaS environment using Terraform. Each group will provision the same set of resources, but **each group's Terraform state is isolated by using a unique key in the backend**.

## High-Level Steps

1. **Initialize the Project Folder**
2. **Configure the Terraform Backend for Remote State**
3. **Create Required Azure Resources**
   - Resource Group
   - Key Vault
   - App Service Plan (Windows)
   - Windows Web App with Managed Identity and Key Vault URI as app setting
4. **Apply and Validate**
5. **Share Your Resource Outputs**

## Step-by-Step Instructions

### 1. Initialize Your Project Folder

- Open Visual Studio Code (VS Code).
- Create a new folder for your group's lab (e.g., `<org>-lab-group1`).
- All work for your group should be done inside this folder.

### 2. Configure Terraform Backend for Remote State

- All groups will use the **same storage account, resource group, and container** for the Terraform backend.
- Each group will use a **different key** for their state file.

For example:
- Group 1: `group1.tfstate`
- Group 2: `group2.tfstate`
- Group 3: `group3.tfstate`

This ensures that each group's deployments are managed and tracked separately, even though they are working in the same Azure environment.

### 3. Define & Deploy Required Resources

**Each group must use Terraform to deploy:**

- **Azure Resource Group**
  - Name pattern: `<org>-rg-<regionSuffix>-prod-grp<group number>`
  
- **Azure Key Vault**
  - Name pattern: `<org>-akv-<regionSuffix>-prod-grp<group number>-001`
  - Must be deployed in your resource group and region.
  - Enable soft-delete and use RBAC for access management.
  
- **Azure App Service Plan (Windows, B1 SKU)**
  - Name pattern: `<org>-asp-<regionSuffix>-prod-grp<group number>-win`
  - Must be deployed in your resource group and region.
  
- **Azure Windows Web App (Frontend)**
  - Name pattern: `<org>-<regionSuffix>-web-prod-grp<group number>-001`
  - Must use the App Service Plan above.
  - Enable system-assigned managed identity.
  - Configure App Settings to include the Key Vault URI (`KEY_VAULT_URI`).
  - Set the .NET version to 6.0.

### 4. Apply and Validate

- Initialize your Terraform working directory (`terraform init`).
- Plan and apply your deployment (`terraform plan`, then `terraform apply`).
- After deployment, verify that:
  - All resources are visible in your Azure portal, in your assigned resource group.
  - The Windows Web App has the correct app settings and managed identity enabled.
  - The Key Vault exists and is accessible from the portal.

### 5. Share Outputs & Collaborate

- Note the **resource names** and app URL for your group.
- Share your findings and troubleshooting steps with other groups.
- Each group's state is independent, but the environment is consistent for all.


