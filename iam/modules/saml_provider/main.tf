resource "aws_iam_saml_provider" "idp" {
  name                   = "${var.name}"
  saml_metadata_document = "${file("${path.cwd}/resources/saml_metadata/${var.name}.xml")}"
}
