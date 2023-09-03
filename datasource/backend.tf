terraform {
  backend "gcs" {
    bucket  = "cloudclan-terraform-mngmt"
    prefix  = "cloudlan/vm"
  }
}