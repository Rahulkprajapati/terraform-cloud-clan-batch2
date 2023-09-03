module "dev-infra" {
    #source tells terraform where to find the module
    source = "../root-module"
    instance_name = "dev-instance"
    vpc-name = "dev-network"
    subnetwork-name = "dev-subnetwork"
    ip_cidr_range = "10.20.0.0/16"
}