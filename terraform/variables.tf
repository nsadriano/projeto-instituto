variable "region" {
     default = "us-east-1"
}

variable "availabilityZone" {
     default = "us-east-1a"
}

variable "instanceTenancy" {
    default = "default"
}

variable "dnsSupport" {
    default = true
}

variable "dnsHostNames" {
    default = true
}

variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}

variable "publicsCIDRblock" {
    default = "10.0.1.0/24"
}

variable "publicdestCIDRblock" {
    default = "0.0.0.0/0"
}

variable "mapPublicIP" {
    default = true
}

variable "proxy-ports" {
  type    = list(number)
  default = [22, 80, 8080, 9200, 9300, 5601, 9500]
}

variable "keyname" {
  default = "projeto-ia"
}