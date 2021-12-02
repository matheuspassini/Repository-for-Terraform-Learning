resource "random_integer" "name" {
  max = 300
  min = 70

    lifecycle {
      create_before_destroy = false
      prevent_destroy = false
      #ignore_changes = [min]
    }
}