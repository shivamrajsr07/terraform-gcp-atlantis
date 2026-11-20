
project_id = "terraform-atlantis-shivam-p2"

region = "asia-south1"
zone   = "asia-south1-a"

network_name            = "terraform-vpc-project2"
auto_create_subnetworks = false
routing_mode            = "REGIONAL"

instance_name  = "terraform-vm-project2"
machine_type   = "e2-micro"
image          = "debian-cloud/debian-12"
boot_disk_size = 10
network        = "terraform-vpc-project2"

bucket_name        = "terraform-atlantis-project2-323515237807"
storage_class      = "STANDARD"
versioning_enabled = true

service_account_email = "terraform-deployer@terraform-atlantis-shivam-2026.iam.gserviceaccount.com"

iam_roles = [
  "roles/compute.admin",
  "roles/storage.admin"
]
