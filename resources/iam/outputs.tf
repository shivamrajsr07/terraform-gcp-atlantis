output "service_account_email" {
  description = "Terraform deployment service account"
  value       = var.service_account_email
}

output "assigned_iam_roles" {
  description = "IAM roles managed by Terraform"
  value       = var.iam_roles
}