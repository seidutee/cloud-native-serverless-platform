variable "bucket_name" {

  description = "S3 bucket used to store Lambda deployment packages."

  type = string
}

variable "tags" {

  description = "Tags applied to the bucket."

  type = map(string)

  default = {}
}