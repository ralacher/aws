resource "aws_s3_bucket" "output" {
  bucket = "rlacher-bucket-outputs"
  tags   = var.tags
}