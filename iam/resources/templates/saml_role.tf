# -------------------------------------------
# ROLE_NAME
# -------------------------------------------
module "ROLE_NAME" {
  source = "./modules/saml_role"

  name              = "ROLE_NAME"
  saml_provider_arn = "${module.SAML_NAME.arn}"
  policies          = ["${module.POLICY_NAME.arn}"]
  policies_count    = 1
}

output "ROLE_NAME" {
  value = "${module.ROLE_NAME.arn},${module.SAML_NAME.arn}"
}
