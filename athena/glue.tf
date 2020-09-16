
resource "aws_glue_catalog_database" "database" {
  name = "lab"
}

resource "aws_glue_crawler" "crawlers" {
  count         = length(var.datasets)
  database_name = lower(aws_glue_catalog_database.database.name)
  name          = var.datasets[count.index].name
  role          = aws_iam_role.glue.arn

  s3_target {
    path = var.datasets[count.index].url
  }
}