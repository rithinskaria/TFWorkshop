# Lab 02: Create Two Azure Storage Accounts Using Terraform

## Objective

Use Terraform to deploy two Azure Storage Accounts into a Resource Group that was created manually using Azure CLI. Each storage account must include a tag: `Owner: <yourname>`

## Folder Naming Convention

Create and open the folder in VS Code: `terraform-lab-02-storage-accounts`

## Steps

1. **Open Terminal in VS Code**

2. **Sign in to Azure**
   ```bash
   az login
   ```

3. **Create Resource Group Using Azure CLI**
   - Use this command to create the RG:
   ```bash
   az group create --name rg-<yourname>-<org>-lab-02 --location eastus
   ```
   - Replace `<yourname>` with your actual name (e.g., `rg-rithin-<org>-lab-02`).

4. **Inside VS Code, Create Terraform Files**
   - Create a file named: `main.tf`

5. **Define Two Storage Accounts in Terraform**
   - Both should be created inside the RG: `rg-<yourname>-<org>-lab-02`
   - Azure uses unique names for storage accounts, try making your storage account name using letters and numbers. Eg: sarithin6fd0
   - Both must include a tag:
   ```hcl
   Owner = "<yourname>"
   ```

6. **Initialize Terraform**
   ```bash
   terraform init
   ```

7. **Validate the Configuration**
   ```bash
   terraform validate
   ```

8. **Deploy the Storage Accounts**
   ```bash
   terraform plan
   terraform apply
   ```

9. **Verify Deployment**
   - Use Azure Portal or CLI to confirm that both storage accounts were created under the specified resource group and include the correct Owner tag.

## Deliverables

- A valid `main.tf` defining both storage accounts.
- Tags with `Owner: <yourname>` on each storage account.
- Storage accounts created successfully inside the manually created resource group.


