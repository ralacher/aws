variable "dataset" {
  type = map
  default = {
    url  = "s3://aws-bigdata-blog/artifacts/glue-data-lake/data/",
    name = "taxis"
  }
}

variable "tags" {
  type = map
  default = {
    "resource_group" : "athena"
  }
}