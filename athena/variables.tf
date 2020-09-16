variable "datasets" {
  type = list(object({
    url  = string
    name = string
  }))
  default = [
    { url = "s3://aws-bigdata-blog/artifacts/glue-data-lake/data/", name = "taxis" }
  ]
}

variable "tags" {
  type = map
  default = {
    "resource_group" : "athena"
  }
}