resource "local_file" "file" {
  filename = "implicit.txt"
  content = "This is RANDOM STRING FROM RANDOM PROVIDER:  ${random_string.name.id}"
}

resource "random_string" "name" {
  length = 10
}

resource "local_file" "file2" {
  filename = "explicit.txt"
  content = "This is RANDOM STRING FROM RANDOM PROVIDER:  ${random_string.name2.id}"
  depends_on = [random_string.name2]
}

resource "random_string" "name2" {
  length = 10
}