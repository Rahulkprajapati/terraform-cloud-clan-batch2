data "terraform_remote_state" "pull" {
  backend = "gcs"
  config = {
    bucket  = "<backend gcs bucket name from where you want to pull the state file>"
    prefix  = "folder directory where the state file is stored"
  }
}