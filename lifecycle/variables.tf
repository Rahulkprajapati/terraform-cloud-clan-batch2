# variable "project_name" {
#   type        = string
#   default     = "abiding-honor-383407"
#   description = "value of the project name"
# }

# # STRING variable
# variable "instance" {
#     type        = string
#     # description = "value of the instance name"
#     # default     = "cloudclan-instance"
# }

#LIST variable
variable "instance_name" {
  type    = list(string)
  default = ["dev", "prd"]
}


#MAP variable
# variable "instance_name" {
#   type = map(any)
#   default = {
#     "dev-project" = "spiderman"
#     "prd-project" = "batman"
#   }
# }

#Object variable

# variable "instance_data" {
#     type = object({
#         name = string
#         machine_type = string
#         tags = list(string)
#     })
#     default = {
#       name = "insatnce-cloudclan"
#       machine_type = "e2-medium"
#       tags = ["foo", "bar"]
#     }
# }

variable "is_instance_required" {
  type    = bool
  default = true
}