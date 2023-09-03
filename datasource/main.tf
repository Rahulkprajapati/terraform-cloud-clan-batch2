resource "google_compute_instance" "cloud-clan-data" {
  name         = "compute-datasource-example"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = data.terraform_remote_state.pull.outputs.vpc-id
    subnetwork = data.terraform_remote_state.pull.outputs.subnetwork-id
    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

}