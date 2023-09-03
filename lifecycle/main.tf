resource "google_compute_instance" "cloud-vm" {
  # for_each helps to create multiple instances or boolean values
  name = "cloudclan-vm"
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


  #create_before_destroy will create the new resource before destroying the old one

  # lifecycle {
  #   create_before_destroy = true
  # }

  # ignore_changes will ignore the changes in the resource
  # lifecycle {
  #   ignore_changes = all
  # }
  
  # prevent_destroy will prevent the resource from being destroyed
  # lifecycle {
  #   prevent_destroy = true
  # }

}


#subnetwork
resource "google_compute_subnetwork" "cloudclan-subnetwork" {
  name          = "cloudclan-subnetwork-custom"
  ip_cidr_range = "10.2.0.0/16"
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
  name                    = "cloudclan-network-custom"
  auto_create_subnetworks = false
}