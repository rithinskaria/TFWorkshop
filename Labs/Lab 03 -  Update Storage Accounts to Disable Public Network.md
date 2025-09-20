# Lab 03: Update Storage Accounts to Disable Public Network Access (Continuation of Lab 02)

## Objective

In this lab, you'll continue from Lab 02 and update the two existing Azure Storage Accounts to disable public network access, using the same Terraform project and state.

## Folder Used

Use the same folder as Lab 02: `terraform-lab-02-storage-accounts`

⚠️ **Important:** Do not create a new folder. This lab is a direct continuation and relies on the state from Lab 02.

## Steps

1. **Open the Existing Folder in VS Code**
   - Ensure you're in the `terraform-lab-02-storage-accounts` folder.

2. **Open main.tf and Edit Both Storage Account Resources**
   - Edit the file to ensure public access is disabled for both storage accounts

3. **Validate the Updated Configuration**
   ```bash
   terraform validate
   ```

4. **Run a Terraform Plan to See the Changes**
   ```bash
   terraform plan
   ```

5. **Apply the Update**
   ```bash
   terraform apply
   ```

6. **Verify the Update Using Azure CLI for both storage accounts**
   ```bash
   az storage account show --name <storage-name> --resource-group rg-<yourname>-<org>-lab-02 --query "publicNetworkAccess"

   ```
   - Ensure both return "Disabled"

## 📦 Deliverables

- Updated `main.tf` with public access disabled in both storage account blocks.
- Terraform state shows update actions (not resource recreation).
- Public network access successfully disabled on both storage accounts.


