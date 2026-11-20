# Terraform GCP Atlantis Infrastructure

## 1. Project Overview

This project demonstrates Infrastructure as Code (IaC) using **Terraform, Google Cloud Platform (GCP), and Atlantis**.

The objective is to provision and manage GCP infrastructure across two separate GCP projects using reusable Terraform configurations, remote state management, and GitHub Pull Request automation through Atlantis.

## 2. Technologies Used

- Terraform
- Google Cloud Platform (GCP)
- Atlantis
- Git and GitHub
- HCL
- YAML
- Ubuntu on WSL

## 3. Project Architecture

The project manages four infrastructure components across two GCP projects.

| Component | Purpose |
|---|---|
| VPC | Creates and manages VPC networks |
| Compute | Provisions Compute Engine virtual machines |
| Storage | Creates Cloud Storage buckets |
| IAM | Manages project-level IAM permissions |

### GCP Projects

**Project 1**
- Project ID: `terraform-atlantis-shivam-2026`
- Region: `asia-south1`
- Zone: `asia-south1-a`

**Project 2**
- Project ID: `terraform-atlantis-shivam-p2`
- Region: `asia-south1`
- Zone: `asia-south1-a`

Project 2 infrastructure deployment is pending billing enablement.

## 4. Directory Structure

```text
terraform-gcp-atlantis/
│
├── README.md
├── .gitignore
├── atlantis.yaml
│
├── resources/
│   ├── compute/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── backend.tf
│   │
│   ├── storage/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── backend.tf
│   │
│   └── vpc/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── backend.tf
│
├── iam/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
│
├── variables/
│   ├── project1.tfvars
│   └── project2.tfvars
│
└── backend/
    ├── backend.tfbackend
    ├── project1.tfbackend
    └── project2.tfbackend
```

## 5. Terraform Configuration

Each Terraform root contains:

| File | Responsibility |
|---|---|
| `main.tf` | Defines infrastructure resources |
| `provider.tf` | Configures Terraform and the GCP provider |
| `variables.tf` | Declares input variables |
| `outputs.tf` | Defines resource outputs |
| `backend.tf` | Declares the remote backend |

### Infrastructure Components

**VPC**
- Creates custom VPC networks.
- Supports configurable routing mode.
- Controls automatic subnet creation.

**Compute**
- Creates Compute Engine instances.
- Configures machine type, boot image and disk size.
- Connects instances to the specified VPC.

**Storage**
- Creates Google Cloud Storage buckets.
- Enables uniform bucket-level access.
- Enforces public access prevention.
- Supports object versioning.

**IAM**
- Manages project IAM role assignments.
- Uses a configurable service account.
- Supports multiple IAM roles through `for_each`.

## 6. Remote State Management

Terraform remote state is configured using the GCS backend.

**State bucket:**

`terraform-atlantis-state-323515237807`

**State prefix:**

`terraform-atlantis/states`

The backend uses service account impersonation rather than a downloaded service account key.

### Workspace Separation

Eight independent Atlantis workspaces are configured:

| GCP Project | Terraform Component | Workspace |
|---|---|---|
| Project 1 | VPC | `project1-vpc` |
| Project 1 | Compute | `project1-compute` |
| Project 1 | Storage | `project1-storage` |
| Project 1 | IAM | `project1-iam` |
| Project 2 | VPC | `project2-vpc` |
| Project 2 | Compute | `project2-compute` |
| Project 2 | Storage | `project2-storage` |
| Project 2 | IAM | `project2-iam` |

Each workspace is intended to maintain an independent Terraform state.

## 7. Atlantis Integration

Atlantis automates Terraform operations through GitHub Pull Requests.

The `atlantis.yaml` file defines:
- Terraform project directories.
- Workspace names.
- Project-specific workflows.
- Backend initialization arguments.
- Variable file selection.
- Plan and apply steps.

### Intended Workflow

1. Developer creates a feature branch.
2. Developer modifies Terraform configuration.
3. Developer pushes changes to GitHub.
4. Developer opens a Pull Request.
5. Atlantis detects the changes.
6. Atlantis executes Terraform plan.
7. Reviewer checks the plan.
8. Authorized user approves and runs the apply operation.
9. Terraform provisions or updates the GCP infrastructure.

## 8. Authentication and Security

The project uses a dedicated GCP service account:

`terraform-deployer@terraform-atlantis-shivam-2026.iam.gserviceaccount.com`

Configured IAM roles include:

- `roles/compute.admin`
- `roles/storage.admin`

Security practices:
- Use service account impersonation.
- Avoid downloading service account JSON keys.
- Do not commit Terraform state files.
- Do not commit credentials or access tokens.
- Keep `.terraform/` directories out of Git.
- Review Terraform plans before applying changes.

The Atlantis runtime must also have valid GCP credentials for the Google provider.

## 9. Local Development Setup

### Prerequisites

Install and configure:

- Git
- Terraform
- Google Cloud CLI
- GCP project access
- GitHub repository access

### Authenticate with GCP

```bash
gcloud auth login
gcloud auth application-default login
```

Set the Project 1 environment:

```bash
export GOOGLE_PROJECT="terraform-atlantis-shivam-2026"

export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT="terraform-deployer@terraform-atlantis-shivam-2026.iam.gserviceaccount.com"
```

### Terraform Formatting and Validation

Example for VPC:

```bash
cd resources/vpc

terraform fmt -check

terraform init -backend=false

terraform validate
```

Repeat the same validation process for:

- `resources/compute`
- `resources/storage`
- `iam`

## 10. GitHub Workflow

Initialize the repository:

```bash
git init

git branch -M main
```

Add and commit files:

```bash
git add .

git commit -m "Initial Terraform GCP Atlantis setup"
```

Connect the GitHub repository:

```bash
git remote add origin https://github.com/shivamrajsr07/terraform-gcp-atlantis.git
```

Push the main branch:

```bash
git push -u origin main
```

## 11. Current Project Status

| Task | Status |
|---|---|
| GCP Project 1 setup | Completed |
| GCP Project 2 creation | Completed |
| Terraform service account setup | Completed |
| GCP API enablement for Project 1 | Completed |
| GCS remote state bucket creation | Completed |
| Terraform resource configurations | Written |
| Terraform local validation | Completed |
| Project-specific variable files | Prepared |
| Atlantis YAML configuration | Written and syntax-checked |
| Git initialization | Completed |
| GitHub repository creation | Completed |
| GitHub initial push | Pending |
| Atlantis server and GitHub integration | Pending |
| Remote state initialization and testing | Pending |
| Project 1 deployment | Pending |
| Project 2 billing enablement | Pending |
| Project 2 deployment | Pending |

## 12. Important Notes

- Project 2 billing must be enabled before deploying resources.
- Verify remote backend configuration before running Terraform initialization.
- Ensure Atlantis uses the correct workspace and variable file for each project.
- Shared Terraform directories require careful backend initialization and concurrency management.
- Review IAM changes and existing manual permissions before applying Terraform.
- Never apply infrastructure changes without reviewing the Terraform plan.

## 13. Repository

GitHub:

https://github.com/shivamrajsr07/terraform-gcp-atlantis

---

**Project:** Terraform GCP Infrastructure Automation with Atlantis

**Purpose:** Multi-project infrastructure provisioning and management using Infrastructure as Code.
