variable "config_rule_name" {
  description = "Name of the AWS Config rule"
  type        = string
}



variable "owner" {
  type        = string
  description = "service owner"
}

variable "source_identifier" {
  type        = string
  description = "rule"
}

variable "recorder" {
  type = string

}

variable "config_role" {
  type = string
}

variable "iam_role_policy" {
  type = string
}

