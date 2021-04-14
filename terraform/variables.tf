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