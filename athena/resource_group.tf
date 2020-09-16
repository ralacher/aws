resource "aws_resourcegroups_group" "athena" {
  name = "athena-lab"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::S3::Bucket"
  ],
  "TagFilters": [
    {
      "Key": "resource_group",
      "Values": ["athena"]
    }
  ]
}
JSON
  }
}