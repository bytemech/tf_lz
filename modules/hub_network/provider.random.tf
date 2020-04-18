resource "random_id" "id" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    ami_id = "${var.rg_name}"
  }

  byte_length = 8
}
