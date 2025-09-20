# Terraform Azure Workshop

A comprehensive hands-on workshop for learning Terraform with Azure, progressing from basic resource creation to advanced infrastructure patterns and best practices.

## 🎯 Workshop Overview

This workshop provides a structured learning path for mastering Terraform with Azure through 8 progressive labs and a capstone project. Students will learn fundamental concepts, advanced patterns, and real-world best practices for Infrastructure as Code (IaC).

## 📚 Learning Objectives

By completing this workshop, participants will be able to:

- Create and manage Azure resources using Terraform
- Implement infrastructure best practices including remote state management
- Use Terraform variables, data sources, and modules effectively
- Apply advanced patterns like `count`, `for_each`, and resource dependencies
- Build reusable infrastructure components with modules
- Deploy production-ready solutions with security best practices

## 🗂️ Workshop Structure

### Core Labs (8 Labs)

| Lab | Title | Key Concepts | Duration |
|-----|-------|--------------|----------|
| **01** | [Create an Azure Resource Group](./Labs/Lab%2001%20-%20Create%20an%20Azure%20Resource%20Group%20using%20Terraform.md) | Basic Terraform syntax, Azure provider, resource creation | 30 min |
| **02** | [Create Two Azure Storage Accounts](./Labs/Lab%2002%20-%20%20Create%20Two%20Azure%20Storage%20Accounts.md) | Multiple resources, Azure CLI integration, tags | 45 min |
| **03** | [Update Storage Accounts](./Labs/Lab%2003%20-%20%20Update%20Storage%20Accounts%20to%20Disable%20Public%20Network.md) | State management, resource updates, continuation labs | 30 min |
| **04** | [Working with Variables and Provider Version](./Labs/Lab%2004%20-%20%20Working%20with%20Variables%20and%20Provider%20Version.md) | Variables, terraform.tfvars, provider constraints | 45 min |
| **05** | [Create a Virtual Machine](./Labs/Lab%2005%20-%20Create%20a%20Virtual%20Machine%20with%20Full%20Resource.md) | Resource dependencies, interpolation, complex infrastructure | 60 min |
| **06** | [Remote Terraform State](./Labs/Lab%2006%20-%20Remote%20Terraform%20State.md) | Backend configuration, Azure Blob Storage, state isolation | 45 min |
| **07** | [Deploy Azure Web App Using Data Blocks](./Labs/Lab%2007%20-%20Deploy%20an%20Azure%20Windows%20Web%20App%20Using%20Terraform%20Data%20Blocks.md) | Data sources, referencing existing resources | 45 min |
| **08** | [Deploy Multiple Web Apps with Modules](./Labs/Lab%2008%20-%20Deploy%20Multiple%20Azure%20Web%20Apps.md) | Terraform modules, reusable components, advanced patterns | 60 min |

### Capstone Project

| Project | Title | Key Concepts | Duration |
|---------|-------|--------------|----------|
| **Capstone** | [Azure Web App with Key Vault and Managed Identity](./Capstone/Capstone.md) | Production patterns, security, group collaboration | 90 min |

### Advanced Scenarios (Reference Examples)

The `Advanced Scenarios` directory contains working examples for advanced Terraform patterns:

- **[count](./Advanced%20Scenarios/count/)** - Using count meta-argument for resource iteration
- **[for-each](./Advanced%20Scenarios/for-each/)** - Using for_each for advanced resource iteration
- **[modules](./Advanced%20Scenarios/modules/)** - Complete module structure with webapp module example
- **[provisioners](./Advanced%20Scenarios/provisioners/)** - Using Terraform provisioners for post-deployment tasks

## 🔧 Prerequisites

### Required Software
- [Terraform](https://www.terraform.io/downloads.html) (>= 1.0)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Visual Studio Code](https://code.visualstudio.com/) with Terraform extension
- Git (for cloning this repository)

### Azure Requirements
- Azure subscription with contributor access
- Azure CLI authenticated (`az login`)
- Sufficient permissions to create:
  - Resource Groups
  - Storage Accounts
  - Virtual Networks and VMs
  - App Service Plans and Web Apps
  - Key Vaults

### Knowledge Prerequisites
- Basic understanding of cloud computing concepts
- Familiarity with Azure services (helpful but not required)
- Command line experience
- Basic understanding of JSON/HCL syntax

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/rithinskaria/TFWorkshop.git
cd TFWorkshop
```

### 2. Authenticate with Azure
```bash
az login
az account show  # Verify correct subscription
```

### 3. Start with Lab 01
Navigate to the `Labs` directory and begin with Lab 01. Each lab builds upon the previous one, so complete them in order.

### 4. Workshop Flow
```
Lab 01 → Lab 02 → Lab 03 → Lab 04 → Lab 05 → Lab 06 → Lab 07 → Lab 08 → Capstone
```

## 📋 Workshop Guidelines

### Naming Conventions
Throughout the workshop, use these naming patterns:
- **Folders**: `terraform-lab-XX-description`
- **Resource Groups**: `rg-<yourname>-<org>-lab-XX`
- **Resources**: Follow Azure naming conventions with consistent prefixes

### Best Practices Emphasized
- ✅ Remote state management
- ✅ Variable usage and organization
- ✅ Resource tagging
- ✅ Provider version constraints
- ✅ Modular code structure
- ✅ Security patterns (Key Vault, Managed Identity)

### File Organization
Each lab follows a consistent structure:
```
terraform-lab-XX-name/
├── main.tf           # Primary resource definitions
├── variables.tf      # Variable declarations
├── terraform.tfvars  # Variable values
├── outputs.tf        # Output definitions (when needed)
└── modules/          # Local modules (advanced labs)
```

## 🎓 Learning Path

### Beginner (Labs 1-3)
- Basic Terraform syntax and workflow
- Resource creation and updates
- Azure provider basics

### Intermediate (Labs 4-6)
- Variables and configuration management
- Complex resource dependencies
- Remote state management

### Advanced (Labs 7-8)
- Data sources and existing resource integration
- Terraform modules and reusable components
- Production patterns

### Expert (Capstone)
- End-to-end secure solution
- Team collaboration
- Production-ready architecture

## 🔍 Key Terraform Concepts Covered

| Concept | Introduced In | Reinforced In |
|---------|---------------|---------------|
| Resources | Lab 01 | All labs |
| Variables | Lab 04 | Labs 5-8, Capstone |
| State Management | Lab 03 | Lab 06 onwards |
| Data Sources | Lab 07 | Lab 08, Capstone |
| Modules | Lab 08 | Capstone |
| Remote State | Lab 06 | Labs 7-8, Capstone |
| Dependencies | Lab 05 | Labs 7-8, Capstone |
| Security Patterns | Capstone | - |

## 🛠️ Troubleshooting

### Common Issues
1. **Azure CLI Authentication**: Ensure `az login` is completed
2. **Terraform State Locks**: Use `terraform force-unlock` if needed
3. **Resource Naming**: Azure has strict naming requirements
4. **Provider Versions**: Ensure compatible azurerm provider versions

### Getting Help
- Review lab instructions carefully
- Check Terraform documentation
- Use `terraform plan` to preview changes
- Leverage VS Code Terraform extension for syntax help

## 📖 Additional Resources

### Terraform Documentation
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Language](https://www.terraform.io/docs/language/index.html)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

### Azure Documentation
- [Azure Architecture Center](https://docs.microsoft.com/en-us/azure/architecture/)
- [Azure Naming Conventions](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

## 🤝 Contributing

This workshop is designed for educational purposes. If you find issues or have suggestions for improvements:

1. Fork the repository
2. Create a feature branch
3. Submit a pull request with clear descriptions

## 📄 License

This workshop is provided for educational purposes. Please respect all Azure service terms and conditions.

---

**Happy Learning! 🎉**

*Master Terraform and Azure Infrastructure as Code through hands-on practice and real-world scenarios.*