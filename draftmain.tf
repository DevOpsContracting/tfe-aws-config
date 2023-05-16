
# provider "aws" {
#   region = "us-east-1"

# }

# terraform {

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~>4.23"
#     }
#   }

# }

# data "aws_caller_identity" "current" {}

# locals {
#   account_id = data.aws_caller_identity.current.account_id
# }

# resource "aws_config_config_rule" "config_rule" {
#   name = var.config_rule_name
#   source {
#     owner             = var.owner
#     source_identifier = var.source_identifier
#   }
#   input_parameters = {
#     awsAccountId = local.account_id
#   }
# }
