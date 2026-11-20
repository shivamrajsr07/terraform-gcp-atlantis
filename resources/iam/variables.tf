variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "service_account_email" {
  description = "Terraform deployment service account email"
  type        = string
}

variable "iam_roles" {
  description = "IAM roles assigned to the Terraform service account"
  type        = list(string)

  default = [
    "roles/compute.admin",
    "roles/storage.admin"
  ]
}