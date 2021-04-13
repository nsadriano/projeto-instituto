variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "keyname" {
  default = "projeto-ia"
}

variable "proxy-ports" {
  type    = list(number)
  default = [22, 80, 8080]
}

variable "cidr_block_vpc" {
  default = "172.16.0.0/16"
}

variable "cidr_block_subnet" {
  default = "172.16.10.0/24"
}