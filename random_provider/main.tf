resource random_integer "rint" {
  max = 1000
  min = 50
}

resource "random_string" "rstring" {
  length = 15
}

output "name1" {
  value = random_integer.rint.result
}

output "name2" {
  value = random_string.rstring.result
}