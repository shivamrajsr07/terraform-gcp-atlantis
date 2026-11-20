output "bucket_name" {
  description = "Created storage bucket name"
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "Google Cloud Storage URL"
  value       = google_storage_bucket.bucket.url
}

output "bucket_self_link" {
  description = "Storage bucket self link"
  value       = google_storage_bucket.bucket.self_link
}