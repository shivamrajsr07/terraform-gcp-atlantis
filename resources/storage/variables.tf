variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud storage region"
  type        = string
}

variable "bucket_name" {
  description = "Globally unique storage bucket name"
  type        = string
}

variable "storage_class" {
  description = "Storage class"
  type        = string
  default     = "STANDARD"
}

variable "versioning_enabled" {
  description = "Enable bucket object versioning"
  type        = bool
  default     = true
}