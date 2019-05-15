resource "aws_iam_role" "SSORole" {
  name                 = "${var.name}"
  description          = "Managed with Terraform for SAML integration"
  max_session_duration = 43200

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${var.saml_provider_arn}"
      },
      "Action": "sts:AssumeRoleWithSAML",
      "Condition": {
        "StringEquals": {
          "SAML:aud": "https://signin.aws.amazon.com/saml"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count      = "${var.policies_count}"
  role       = "${aws_iam_role.SSORole.name}"
  policy_arn = "${var.policies[count.index]}"
}
