# Terraform S3 Demo

This project demonstrates how to create an AWS S3 bucket using Terraform.

## Workflow Commands

### 1. Initialize Terraform
Initializes the working directory containing Terraform configuration files. This is the first command that should be run after writing a new Terraform configuration.
```bash
terraform init
```

### 2. Format Code
Rewrites Terraform configuration files to a canonical format and style.
```bash
terraform fmt
```

### 3. Validate Code
Validates the configuration files in a directory, referring only to the configuration and not accessing any remote services.
```bash
terraform validate
```

### 4. Create Execution Plan
Creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.
```bash
terraform plan
```

### 5. Apply Changes
Executes the actions proposed in a Terraform plan.
```bash
terraform apply
```

### 6. Show State
Provides human-readable output from a state or plan file.
```bash
terraform show
```

### 7. View Outputs
Extracts the value of an output variable from the state file.
```bash
terraform output
```

### 8. Destroy Infrastructure
Destroys all remote objects managed by a particular Terraform configuration.
```bash
terraform destroy
```
