resource "local_file" "res" {
  filename = var.filename1
  content = var.content1["name"]
}