
variable "Dev_Instance_AMI_id" {
  description = "development ami id"
  type = string
  default = "ami-07151644aeb34558a"
}
 # deve instance type

variable "Dev_Instance_type" {
  description = "Development instance type"
  type = list(string)
  default = ["t2.micro","t2.small","t2.nano"]
}
