resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  project      = var.project_id
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size
    }
  }

  network_interface {
    network = var.network
  }
}