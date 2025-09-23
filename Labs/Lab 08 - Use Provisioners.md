
# Lab 09: Use Provisioners

  

## Objectives

  

- Deploy an Ubuntu virtual machine using Terraform

- Use Terraform provisioners to install and configure Apache web server

- Create a custom landing page displaying your name

- Configure network security groups to allow SSH and HTTP traffic

- Use admin password authentication for the VM

  

## Prerequisites

  

- Terraform and Azure CLI installed

- Visual Studio Code

- An Azure subscription with contributor access

- Basic understanding of Linux commands

  

## Folder Structure

  

```

Lab-09-Provisioners/

├── main.tf

├── variables.tf

├── terraform.tfvars

└── provider.tf

```

  

## Lab Steps

  

### Step 1: Set Up Folder Structure

  

1. Open VS Code and in the integrated terminal:

```bash

mkdir Lab-09-Provisioners

cd Lab-09-Provisioners

```

  

2. Create the following files:

-  `main.tf`

-  `variables.tf`

-  `terraform.tfvars`

-  `provider.tf`

  

### Step 2: Configure Provider

  

In `provider.tf`:

- Configure the AzureRM provider.
  

### Step 3: Define Variables


In `variables.tf`, define variables for:

- Resource group name

- Location (default: "East US")

- VM name

- Admin username (default: "azureuser")

- Admin password (mark as sensitive)

In `terraform.tfvars`, set values using the naming convention:

-  **Resource group**: `rg-lab09-<code>` (e.g., `rg-lab09-abc` or `rg-lab09-johnsmith`)

-  **VM name**: `vm-web-<code>` (e.g., `vm-web-abc` or `vm-web-johnsmith`)

- Set a strong password like "TerraformLab@123!"

- Enter your actual name for the web page

  

> **Important**: Replace `<org>` with your unique identifier (2-8 characters) to avoid naming conflicts with other students.

  

### Step 4: Create Network Infrastructure

  

In `main.tf`, create the following resources with these naming conventions:

  

-  **Resource group**: `rg-lab09-<code>`

-  **Virtual network**: `vnet-lab09-<code>` (10.0.0.0/16 address space)

-  **Subnet**: `snet-internal-<code>` (10.0.2.0/24 address range)

-  **Network Security Group**: `nsg-lab09-<code>` with rules for:

- SSH (port 22, priority 1001)

- HTTP (port 80, priority 1002)

-  **Public IP**: `pip-vm-<code>` with static allocation

-  **Network interface**: `nic-vm-<code>` connecting subnet and public IP

-  **NSG association**: Connect the network interface with the security group

  

> **Note**: Replace `<code>` with your identifier to ensure resource name uniqueness across subscription.

  

### Step 5: Create Virtual Machine

  

In `main.tf`, add:

-  **Linux virtual machine**: `vm-web-<code>` with:

- Size: Standard_B2s

- Ubuntu 22.04 LTS (use Canonical publisher, 0001-com-ubuntu-server-jammy offer)

- Admin password authentication enabled

- Standard_LRS OS disk

 
> **Tip**: Use the same `<code>` identifier for consistency across all resources.

  

### Step 6: Add Provisioner
 

Add a `remote-exec` provisioner to the VM with these commands:

```bash

sudo  apt  update  -y

sudo  apt  install  -y  apache2

sudo  systemctl  start  apache2

sudo  systemctl  enable  apache2

echo  '<h1>Hello [Your Name]</h1> <br>'  |  sudo  tee  /var/www/html/index.html

echo  '<p>This web server was configured using Terraform provisioners!</p>'  |  sudo  tee  -a  /var/www/html/index.html

```

  
 
Include a connection block with:

- SSH connection type

- Public IP as host

- Admin credentials

- 5-minute timeout

  

### Step 7: Define Outputs

  
In `main.tf`, output:

- Public IP address


### Step 8: Deploy and Test

  

1. Initialize Terraform:

```bash

terraform init

```

  

2. Plan and apply:

```bash

terraform plan

terraform apply

```

  

3. Test the deployment:

- Open the website URL in your browser

- Verify your custom greeting appears




### Step 9: Validation

  

- Confirm the website displays your personalized greeting
  

### Optional Cleanup

  

```bash

terraform  destroy

```


Type `yes` when prompted.

  

## Understanding Provisioners

  

**Key Concepts:**

-  **remote-exec**: Runs commands on the remote resource after creation

-  **Connection block**: Defines how Terraform connects to the resource

-  **Provisioner timing**: Runs after resource creation, before Terraform considers it complete

  

**Best Practices:**

- Use provisioners sparingly; consider cloud-init or custom images instead

- Handle authentication securely (SSH keys preferred over passwords in production)

- Include proper timeout values

- Make commands idempotent when possible

  

## Lab Completion

  

You've successfully deployed an Ubuntu VM and used Terraform provisioners to automatically install and configure Apache web server with a custom landing page. This demonstrates Infrastructure as Code principles for both infrastructure deployment and application configuration.