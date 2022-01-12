resource "null_resource" "null" {
  count = 3

  provisioner "local-exec" {
    command = "echo The number is ${count.index}"
  }

}