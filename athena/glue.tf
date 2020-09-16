resource "aws_glue_crawler" "crawlers" {
  database_name = aws_glue_catalog_database.database.name
  name          = var.dataset.name
  role          = aws_iam_role.glue.arn

  s3_target {
    path = var.dataset.url
  }
}

resource "aws_glue_catalog_database" "database" {
  name = "lab"
}