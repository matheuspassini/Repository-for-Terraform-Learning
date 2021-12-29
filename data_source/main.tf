data "local_file" "name" {
  filename = "sample4.txt"
}

output "output" {
  value = data.local_file.name.content
}