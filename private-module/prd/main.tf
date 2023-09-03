module "prd-infra" {
    #source tells terraform where to find the module
    source = "../root-module"
    instance_name = "prd-instance"
    vpc-name = "prd-network"
    subnetwork-name = "prd-subnetwork"
    ip_cidr_range = "10.21.0.0/16"
}