variable "vpc_cdir" {
  type = map(string)
  default = {
    web = "172.27.0.0/16"
  }
}
variable "subnet_cidr" {
  type = map(string)
  default = {
    public = "172.27.1.0/24"
    private = "172.27.2.0/24"
  }
}
variable "Production_Region" {
  type = string
  default = "eu-west-1"
}