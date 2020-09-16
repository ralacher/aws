resource "aws_athena_workgroup" "workgroup" {
  name        = "lab"
  description = "My lab workgroup"
  tags        = var.tags
  configuration {
    result_configuration {
      output_location = "s3://${aws_s3_bucket.output.bucket_regional_domain_name}"
    }
  }
}