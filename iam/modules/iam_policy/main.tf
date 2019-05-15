resource "aws_iam_policy" "iam_policy" {
  name        = "${var.name}"
  description = "Managed with Terraform for SAML integration"
  policy      = "${file("${path.cwd}/resources/policies/${var.name}.json")}"
}
