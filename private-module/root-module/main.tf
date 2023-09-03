resource "google_compute_instance" "cloud-vm" {
  name = var.instance_name
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar", "cloudclan-terraform"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  #Define the network interface
  network_interface {
    network    = google_compute_network.cloudclan-network.id
    subnetwork = google_compute_subnetwork.cloudclan-subnetwork.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "cloudclan"
  }
  metadata_startup_script = "echo hi > /test.txt"

  # we need to use depends_on to ensure the subnetwork and random_string has been created
  depends_on = [
    google_compute_subnetwork.cloudclan-subnetwork,
  ]

  # lifecycle {
  #   create_before_destroy = true
  # }
  # lifecycle {
  #   ignore_changes = all
  # }
}

#subnetwork
resource "google_compute_subnetwork" "cloudclan-subnetwork" {
  name          = var.subnetwork-name
  ip_cidr_range = var.ip_cidr_range
  region        = "us-central1"
  network       = google_compute_network.cloudclan-network.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }

  # We need to use depends_on to ensure the network has been created
  depends_on = [
    google_compute_network.cloudclan-network
  ]
}


#network -1 
resource "google_compute_network" "cloudclan-network" {
  name                    = var.vpc-name
  auto_create_subnetworks = false
}