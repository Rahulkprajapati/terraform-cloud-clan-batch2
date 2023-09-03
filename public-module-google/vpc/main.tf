module "vpc" {
    #source tells terraform where to find the module
    source  = "terraform-google-modules/network/google"
    version = "~> 7.3"

    project_id   = "< your project id >"
    network_name = "< your network name >"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnetwork-first"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnetwork-second"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name           = "subnetwork-thrid"
            subnet_ip             = "10.10.30.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        }
    ]

    secondary_ranges = {
        subnetwork-first = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]
    }
}