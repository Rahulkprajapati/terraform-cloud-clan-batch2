output "instance-id" {
  value = google_compute_instance.cloud-vm.*.instance_id
}

output "vpc-id" {
  value = google_compute_network.cloudclan-network.id
}

output "subnetwork-id" {
  value = google_compute_subnetwork.cloudclan-subnetwork.id
}