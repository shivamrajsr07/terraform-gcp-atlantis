output "instance_name" {
  description = "Created VM name"
  value       = google_compute_instance.vm.name
}

output "instance_id" {
  description = "Created VM ID"
  value       = google_compute_instance.vm.id
}

output "instance_self_link" {
  description = "Created VM self link"
  value       = google_compute_instance.vm.self_link
}