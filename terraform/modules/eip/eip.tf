resource "aws_eip" "lb" {
  count    = var.az_count
  vpc      = true

  tags = {
      Name = var.eip_for_nat
    }
}


