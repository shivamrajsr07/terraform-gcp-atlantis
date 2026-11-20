
project_config = {
  # --------------------------------------------------
  # PROJECT DETAILS
  # --------------------------------------------------
  project = {
    id = "terraform-atlantis-shivam-2026"
  }

  # --------------------------------------------------
  # LOCATION CONFIGURATION
  # --------------------------------------------------
  location = {
    region = "asia-south1"
    zone   = "asia-south1-a"
  }

  # --------------------------------------------------
  # NETWORK CONFIGURATION
  # --------------------------------------------------
  network = {
    name                    = "terraform-vpc-project1"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

  # --------------------------------------------------
  # COMPUTE CONFIGURATION
  # --------------------------------------------------
  compute = {
    instance_name = "terraform-vm-project1"
    machine_type  = "e2-micro"
    image         = "debian-cloud/debian-12"
    boot_disk_size = 10
    network_name  = "terraform-vpc-project1"
  }

  # --------------------------------------------------
  # STORAGE CONFIGURATION
  # --------------------------------------------------
  storage = {
    bucket_name        = "terraform-atlantis-project1-323515237807"
    storage_class      = "STANDARD"
    versioning_enabled = true
  }

  # --------------------------------------------------
  # IAM CONFIGURATION
  # --------------------------------------------------
  iam = {
    service_account_email = "terraform-deployer@terraform-atlantis-shivam-2026.iam.gserviceaccount.com"

    roles = [
      "roles/compute.admin",
      "roles/storage.admin"
    ]
  }
}
