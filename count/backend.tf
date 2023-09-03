terraform {
  backend "gcs" {
    bucket = "< backend gcs state bucket >"
    prefix = "cloudlan"
  }
}