variable "general_config" {
  type = map(any)
}
variable "regions" {
  type = map(any)
}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "ami" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "public_key_path" {}
variable "public_subnet_ids" {}
variable "private_subnet_ids" {}
variable "instance_id" {}
#variable "zone_name" {}
variable "zone_id" {}
variable "sub_domain_1" {}
variable "webacl_scope" {}