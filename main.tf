#defines rule to be applied
resource "aws_config_config_rule" "config_rule" {
  name = var.config_rule_name

  source {
    owner             = var.owner
    source_identifier = var.source_identifier
  }

  depends_on = [aws_config_configuration_recorder.config_recorder]
}

#responsible for recording configuration changes and capturing resource data.
resource "aws_config_configuration_recorder" "config_recorder" {
  name     = var.recorder
  role_arn = aws_iam_role.config_role.arn
}

#allows config service to assume role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "config_role" {
  name               = var.config_role
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

#set permissions for the iam role
data "aws_iam_policy_document" "config_policy" {
  statement {
    effect    = "Allow"
    actions   = [
      "s3:Get*",
      "s3:List*",
      "s3:Head*",
    ]
    resources = ["*"]
  }
}

#attach permissions and access policies for the role
resource "aws_iam_role_policy" "config_role_policy" {
  name   = var.iam_role_policy
  role   = aws_iam_role.config_role.id
  policy = data.aws_iam_policy_document.config_policy.json
}