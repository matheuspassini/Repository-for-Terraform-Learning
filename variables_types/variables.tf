variable "filename1" {
  type = string
  default = "sample3.txt"
}

variable "content1" {
  type = map
  default = {name = "Hensik", age = 99}
}

#variable "content1" {
#  type = tuple([string, bool, number])
#  default = ["hello", true, 69]
#}

#variable "content1" {
#  type = list(string)
#  default = ["red", "blue"]
#}

#variable "content1" {
#  type = number
#  default = 56
#}

#variable "content1" {
#  type = bool
#  default = true
#}
